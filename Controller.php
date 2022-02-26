<?php

    class Controller {
        private $id;
        private $ano;
        private $mes;
        private $dia;
        private $tipo;
        private $descricao;
        private $valor;

        public function __get ($valor) {
            return $this->$valor;
        }

        public function __set ($valor, $atributo) {
            return $this->$valor = $atributo;
        }
    }

// print_r($_POST['ano']);
// $teste = 'oi';



?>