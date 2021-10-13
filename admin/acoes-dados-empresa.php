<?php session_start();
$razao = $_POST['razao'];
$nomeEmpresa = $_POST['nomeEmpresa'];
$email = $_POST['email'];
$cpf_cnpj = $_POST['cpf_cnpj'];
$inscricaoEstadual = $_POST['inscricaoEstadual'];
$representante = $_POST['representante'];
$bairro = $_POST['bairro'];
$endereco = $_POST['endereco'];
$cidade = $_POST['cidade'];
$estado = $_POST['estado'];
$cep = $_POST['cep'];
$fone = $_POST['fone'];

$cod_login = $_SESSION['cod_login'];
echo $operacao = $_POST['operacao'];

if ($operacao == 'cadastrar') {
    $sql = "INSERT INTO tbl_dados (codUsuarioEmpresa,razao,nomeEmpresa,email,cpf_cnpj,inscricaoEstadual,representante,bairro,endereco,cidade,estado,cep,fone)
            VALUES ('$cod_login','$razao','$nomeEmpresa','$email','$cpf_cnpj','$inscricaoEstadual','$representante','$bairro','$endereco','$cidade','$estado','$cep','$fone')";

$mensagem = "cadastrada com sucesso!";

}

if ($operacao == 'atualizar') {
    $codDadosEmpresa = $_POST['codDadosEmpresa'];

    $sql = "UPDATE tbl_dados SET razao='$razao',
                                 nomeEmpresa='$nomeEmpresa',
                                 email='$email',
                                 cpf_cnpj='$cpf_cnpj',
                                 inscricaoEstadual='$inscricaoEstadual',
                                 representante='$representante',
                                 bairro='$bairro',
                                 endereco='$endereco',
                                 cidade='$cidade',
                                 estado='$estado',
                                 cep='$cep',
                                 fone='$fone'
                                 WHERE codDadosEmpresa=$codDadosEmpresa";
    
    $mensagem = "Dados atualizado com sucesso!";
}

// incluir a conexao
include("../connection/conexao.php");

//executar a instrução sql
$executa = $mysqli->query($sql);


if($executa){
   header("location:index.php?pg=dados-pizzaria&msg=$mensagem");
}else {
   header("location:index.php?pg=dados-pizzaria&msg=Erro ao executar, contate um administrador.");
}


?>