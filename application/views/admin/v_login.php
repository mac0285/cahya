<!DOCTYPE html>
<html>
  <head>
	<title>Masuk</title>
	<link rel="icon" href="<?php echo base_url().'assets/img/ico.png'?>" sizes="32x32">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta name="description" content="Produk By synergydatatrust.com">
    <meta name="author" content="SDT BALI">
    <!-- Bootstrap -->
    <link href="<?php echo base_url().'assets/css/bootstrap.min.css'?>" rel="stylesheet">
    <!-- styles -->
    <link href="<?php echo base_url().'assets/css/stylesl.css'?>" rel="stylesheet">
	
   <link rel="icon" href="<?php echo base_url().'assets/img/ico.png'?>" sizes="32x32">
  </head>
  <body background="<?php echo base_url().'assets/img/home_img.png'?>">
  
   
	<div class="page-content container">
		<div class="row">
			<div class="col-md-4 col-md-offset-4">
				<div class="login-wrapper">
			        <div class="box">
			            <div class="content-wrap">
			                <img width="110px" src="<?php echo base_url().'assets/img/logo_sdt.png'?>"/>
			                <p><?php echo $this->session->flashdata('msg');?></p>
	                        <hr/>
							<form class="form-inline" action="<?php echo base_url().'administrator/cekuser'?>" method="post">
							
							 
	                        	<input class="form-control" type="text" name="username" placeholder="Username" required>
						 
								
								<input class="form-control" type="password" name="password" placeholder="Password" style="margin-bottom:1px;" required>

								
								<div class="action">
				                    <button type="submit" class="btn btn-success" style="width:310px;margin-top:0px; bg-color:#ff9000;">Login</button>
				                </div>
	                        </form>
			                                
			            </div>
			        </div>

			        <div class="already">
			           <!-- <p>Username: admin<br/> Password: admin</p> -->
			            <p>
Copyright © 2012 synergydatatrust.com. | Solusi Online IT dan Teknologi No 1 di Bali.
</p>
			        </div>
			    </div>
			</div>
		</div>
	</div>

	

    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="<?php echo base_url().'assets/js/jquery.min.js'?>"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="<?php echo base_url().'assets/js/bootstrap.min.js'?>"></script>
    
  </body>
</html>