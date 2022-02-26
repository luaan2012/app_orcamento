<?php

require 'Model.php';
require 'Controller.php';
require 'Conexao.php';

$acao = (isset($_POST['acao'])) ? $_POST['acao'] : $_GET['acao'];


if($acao == 'gravar'){
    $controller = new Controller;
    $controller->__set('ano',$_POST['ano']);
    $controller->__set('mes',$_POST['mes']);
    $controller->__set('dia',$_POST['dia']);
    $controller->__set('tipo',$_POST['tipo']);
    $controller->__set('descricao',$_POST['descricao']);
    $controller->__set('valor',$_POST['valor']);   
    $conexao = new Conexao;
    $bd = new Model($controller, $conexao);
    $bd->gravarDb();
}elseif($acao == 'recuperar'){
    $controller = new Controller;
    $conexao = new Conexao;
    $bd = new Model($controller, $conexao);
    $teste = json_encode($bd->recuperarDb());
    print_r($teste);

}elseif($acao == 'pesquisar'){
    $controller = new Controller;
    $controller->__set('ano',$_GET['ano']);
    $controller->__set('mes',$_GET['mes']);
    $controller->__set('dia',$_GET['dia']);
    $controller->__set('tipo',$_GET['tipo']);
    $controller->__set('descricao',$_GET['descricao']);
    $controller->__set('valor',$_GET['valor']); 
    $conexao = new Conexao;
    $bd = new Model($controller, $conexao);
    $sucess = json_encode($bd->filtrar());
    print_r($sucess);
}elseif($acao == 'excluir'){
    $controller = new Controller;
    $controller->__set('id',$_POST['id']);
    $conexao = new Conexao;
    $bd = new Model($controller, $conexao);
    $sucess = $bd->deletar();
    print_r($sucess);
}
    
?>