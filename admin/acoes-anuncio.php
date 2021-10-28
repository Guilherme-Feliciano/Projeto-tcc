<?php session_start();

//receber os campos do formulario
$categoria_produto = $_POST['categoria_produto'];
$nome_produto = $_POST['nome_produto'];
$preco = $_POST['preco'];
$descricao = $_POST['descricao'];

$cod_login = $_SESSION['cod_login'];
$operacao = $_POST['operacao'] ?: $_GET['operacao'];

$imagem = $_FILES['imagem']['name']; //nome original
$imagem_temporaria = $_FILES['imagem']['tmp_name']; // nome temporário 

// obter a extensão do arquivo
$extensao_imagem = strtolower(strrchr($imagem,"."));
$novo_nome = "imagem_".time().$extensao_imagem;



if ($operacao == 'cadastrar') {
    $sql = "INSERT INTO tbl_produto
                        (categoria_produto,nome_poduto,preco,descricao,produto_usuario)
                        VALUES ('$categoria_produto','$nome_produto','$preco','$descricao','$cod_login')";

// fazer o upload da imagem 
if(strlen($imagem) > 0 ){
    copy($imagem_temporaria,"../imagens/$novo_nome");
}

$mensagem = "categoria cadastrada com sucesso";
}
//incluir a conexao
include("../connection/conexao.php");

//executar o sql
$executa = $mysqli->query($sql);

//verificar se o sql foi executado e redimensionar para a  lista de anuncios
if ($executa) {
    header("location:index.php?pg=lista-anuncios&msg=$mensagem");
}else {
    header("location:index.php?pg=lista-anuncios&msg=Erro ao executar, contate um administrador");
}




?>