<!DOCTYPE html>
<html lang="pt-br">

<head>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="favicon/tcc.ico">

    <title>PizzaOn</title>

    <!-- Principal CSS do Bootstrap -->
    <link href="css/bootstrap.css" rel="stylesheet">

    <!-- Estilos customizados para esse template -->
    <link href="css/starter-template.css" rel="stylesheet">

    <!-- FONTAWESOME -->
    <script src="https://kit.fontawesome.com/77f3dd62a7.js" crossorigin="anonymous"></script>
</head>

<body>



<main role="main" class="container">
    <nav aria-label="breadcrumb">
    <ol class="breadcrumb">
        <li class="breadcrumb-item"><a href="index.php">Home</a></li>
        <li class="breadcrumb-item active" aria-current="page">Dados Da Pizzaria</li>
    </ol>
    </nav>
    <h3 class="text-center">Dados Da Pizzaria</h3>

    <div class="container">
        <div class="container">

                <?php
       
        $codLogin = $_SESSION['cod_login'];

        //cria a consulta para exibir as categorias
       $sql = "SELECT * FROM  tbl_dados
                                WHERE codUsuarioEmpresa='$codLogin'";

        //incluir a conexao
        include("../connection/conexao.php");

        //executar a instrução sql
        $executa = $mysqli->query($sql);

        // obter o numero de linhas retornado pela consulta
        $totalLinhas = $executa->num_rows;

        $operacao = "";

        //se o total de linhas for menor que 1, exibir uma mensagem
        if ( $totalLinhas < 1 ) {
        $operacao = "cadastrar";


        }else {
        
        $dados = $executa->fetch_assoc();
        $operacao = "atualizar";
        }

        if (isset($_GET['msg'])) {
            echo "<div class='alert alert-success'>".$_GET['msg']."</div>";
          }


        //obter os dados retornado pela consulta


        ?>

            <form method="POST" action="acoes-dados-empresa.php">
                <div class="form-row">

                    <div class="form-group col-md-9">
                     <label for="inputEmail4">Razão social:</label>
                        <input type="razao" class="form-control" name="razao" id="inputEmail4" placeholder="Razão social"
                        value="<?php echo @$dados['razao'];?>">
                    </div>

                    <div class="form-group col-md-9">
                     <label for="inputEmail4">Nome da empresa:</label>
                        <input type="text" class="form-control" name="nomeEmpresa" id="inputEmail4" placeholder="Nome da empresa"
                        value="<?php echo @$dados['nomeEmpresa'];?>">
                    </div>

                    <div class="form-group col-md-9">
                     <label for="inputEmail4">E-mail</label>
                        <input type="email" name="email" class="form-control" id="inputEmail4" placeholder="E-mail"
                        value="<?php echo @$dados['email'];?>">
                    </div>

                    <div class="form-group col-md-4">
                     <label for="inputEmail4">CPF/CNPJ:</label>
                        <input type="text" class="form-control" name="cpf_cnpj" id="inputEmail4" placeholder="CPF/CNPJ"
                        value="<?php echo @$dados['cpf_cnpj'];?>">
                    </div>
                    

                    <div class="form-group col-md-9">
                     <label for="inputEmail4">Inscrição Estadual:</label>
                        <input type="text" class="form-control" name="inscricaoEstadual" id="inputEmail4" placeholder="Inscrição Estadual"
                        value="<?php echo @$dados['inscricaoEstadual'];?>">
                    </div>

                    <div class="form-group col-md-7">
                     <label for="inputEmail4">Representante:</label>
                        <input type="text" class="form-control" name="representante" id="inputEmail4" placeholder="Representante"
                        value="<?php echo @$dados['representante'];?>">
                    </div>

                    <div class="form-group col-md-6">
                     <label for="inputEmail4">Bairro:</label>
                        <input type="text" class="form-control" name="bairro" id="inputEmail4" placeholder="Bairro"
                        value="<?php echo @$dados['bairro'];?>">
                    </div>

                </div>

                <div class="form-group">
                    <label for="inputAddress">Endereço</label>
                    <input type="text" class="form-control" name="endereco" id="inputAddress" placeholder="Rua dos Bobos, nº 0"
                    value="<?php echo @$dados['endereco'];?>">
                </div>

                <div class="form-row">
                <div class="form-group col-md-6">
                    <label for="inputCity">Cidade</label>
                    <input type="text" class="form-control" name="cidade" id="inputCity" placeholder="Cidade"
                    value="<?php echo @$dados['cidade'];?>">
                </div>

                    <div class="form-group col-md-4">
                    <label for="inputEstado">Estado</label>
                    <select id="id" value="" class="form-control" name="estado">
                        <option selected >Escolher...</option>

                        <?php
                        $consultaDados = "SELECT * FROM estado";

                        //executar a consulta
                        $executaConsultaDados = $mysqli->query($consultaDados);

                        //exibir os dados da consulta
                        while ($dadosEstados = $executaConsultaDados->fetch_assoc()){ 
                        
                        $selected="";

                        if($dadosEstados['id'] == @$dados['estado']){
                            $selected = "selected='selected' ";
                        }
                            
                            
                            
                         ?>

                           <option value="<?php echo $dadosEstados['id'];?>"
                           <?php echo $selected;?>>
                           <?php echo $dadosEstados['nome'];?>
                           </option>

                     <?php   }//fim do while ?>

                    </select>
                    </div>

                    <div class="form-group col-md-2">
                    <label for="inputCEP">CEP</label>
                    <input type="text" name="cep" class="form-control" id="inputCEP" placeholder="cep"
                    value="<?php echo @$dados['cep'];?>">
                    </div>

                    <div class="form-group col-md-9">
                     <label for="inputEmail4">Fone:</label>
                        <input type="text" class="form-control" name="fone" id="inputEmail4" placeholder="fone"
                        value="<?php echo @$dados['fone'];?>">
                    </div>

                </div>
                </div> 

                <button type="submit" class="btn btn-primary">Cadastrar</button>

                <input type="hidden" name="operacao" value="<?php echo $operacao;?>">

                <input type="hidden" name="codDadosEmpresa" value="<?php echo $dados['codDadosEmpresa'];?>">
                </form>
        </div>
    </div>

    </main><!-- /.container -->

    <!-- Principal JavaScript do Bootstrap
    ================================================== -->
    <!-- Foi colocado no final para a página carregar mais rápido -->
    <script src="js/jquery-3.js"></script>
    <script src="js/bootstrap.js"></script>


</body>

</html>