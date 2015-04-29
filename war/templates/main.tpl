<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="utf-8" />
	<title><?php if ( isset( $title ) ): echo implode( ' | ',$title ) . ' | '; endif; ?>War</title>
<?php if ( isset( $css ) ): foreach( $css as $file ): ?>
	<link rel="stylesheet" type="text/css" href="<?php echo $base_url; ?>assets/css/<?php echo $file; ?>.css" media="screen" />
<?php endforeach; endif; if ( isset( $js ) ): foreach( $js as $file ): ?>
	<script type="text/javascript" src="<?php echo $base_url; ?>assets/javascript/<?php echo $file; ?>.js"></script>
<?php endforeach; endif; ?>
</head>
<body>
<?php echo $body; ?>
</body>
</html>