<?php 


    class Model {
        private $controller;
        private $conexao;
        
        public function __construct(Controller $controller, Conexao $conexao){
            $this->controller = $controller;
            $this->conexao = $conexao->conectar();
        }
    

        public function gravarDb() {
            
            $query = "insert into app_despesas(ano, mes, dia, tipo, descricao, valor)values(?,?,?,?,?,?)";

            $stmt = $this->conexao->prepare($query);
            $stmt->bindValue(1, $this->controller->ano);
            $stmt->bindValue(2, $this->controller->mes);
            $stmt->bindValue(3, $this->controller->dia);
            $stmt->bindValue(4, $this->controller->tipo);
            $stmt->bindValue(5, $this->controller->descricao);
            $stmt->bindValue(6, $this->controller->valor);
            $stmt->execute();
        }

        public function recuperarDb() {
           
            $query = "select * from app_despesas";
            $stmt = $this->conexao->prepare($query);
            $stmt->execute();
            $retorno = $stmt->fetchAll(PDO::FETCH_OBJ);
            return $retorno;
        }

        public function filtrar(){
            if($this->controller->ano){
                $query = 'ano = '.$this->controller->ano;
            }if($this->controller->mes){
                $query .= ' and mes = '.$this->controller->mes;
            }if($this->controller->dia){
                $query .= ' and dia = '.$this->controller->dia;
            }if($this->controller->tipo){
                $query .= ' and tipo = '.$this->controller->tipo;
            }if($this->controller->descricao){           
                $query .= " and descricao = '{$this->controller->descricao}'";
            }if($this->controller->valor){
                $query .= ' and valor = '.$this->controller->valor;
            }
            return $this->pesquisar($query);
        }
        
        public function pesquisar($query) {
            $first = $query;
            $query = "select * from app_despesas where ";
            $query .= $first;
            $stmt = $this->conexao->prepare($query);
            $stmt->execute();
            $retorno = $stmt->fetchAll(PDO::FETCH_OBJ);
            return $retorno;

        }

        public function deletar() {
            
            $query = "delete from app_despesas where id = ?";
            $stmt = $this->conexao->prepare($query);
            $stmt->bindValue(1, $this->controller->id);
            $stmt->execute();
            return $stmt;

        }
    }

?>