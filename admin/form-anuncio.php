<nav aria-label="breadcrumb">
  <ol class="breadcrumb">
    <li class="breadcrumb-item"><a href="index.php">Home</a></li>
    <li class="breadcrumb-item"><a href="index.php?pg=lista-anuncios">Anúncios</a></li>
    <li class="breadcrumb-item active" aria-current="page">Cadastro de Anúncio</li>
  </ol>
</nav>

<?php
//receber a operacao
$operacao = $_GET['operacao'];

//incluir a conexao
include("../connection/conexao.php")




?>

<div class="row">
  <div class="col-sm-4">
    <form action="acoes-anuncio.php" method="POST" enctype="multipart/form-data">

      <div class="form-group">
        <label for="categoria">Categoria do anúncio</label>

        <select name="categoria_produto" class="form-control" required>
          <option value="">Selecione a categoria</option>
          <?php
           $consultaCategoria = "SELECT * FROM tbl_categoria";
           
           //executar a consulta
           $executaConsultaCategoria = $mysqli->query($consultaCategoria);

           // exibir os dados da consulta
           while ($dadosCategoria = $executaConsultaCategoria->fetch_assoc() ) {?>
              <option value="<?php echo $dadosCategoria['cod_categoria'];?>">
              <?php echo $dadosCategoria['categoria'];?>
              </option>
             
          <?php }//fim whle         ?>
        </select>

      </div>

      <div class="form-group">
        <label for="nome_produto">Título do anúncio</label>
        <input type="text" name="nome_produto" class="form-control" placeholder="Informe o título para o anúncio" value="" required>
      </div>

      <div class="form-group">
        <label for="preco">Preço</label>
        <input type="text" name="preco" class="form-control" placeholder="Informe o preço" value="" required>
      </div>

      <div class="form-group">
        <label for="descricao">Descrição</label>
        <textarea class="form-control" name="descricao" required></textarea>
      </div>


      <div class="form-group">
        <label for="imagem">Imagem</label>
        <input type="file" class="form-control" name="imagem">
      </div>

      <input type="hidden" name="operacao" value="">
      
      <!-- Campo para armazenar o código da categoria na operação "editar" -->
      <input type="hidden" name="cod_produto" value="">

      <button type="submit" class="btn btn-primary">Salvar</button>

    </form>
  </div>
</div>