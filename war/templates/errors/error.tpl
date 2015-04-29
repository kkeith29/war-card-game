<?php if ( $full === true ): ?>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="utf-8" />
	<title>Error</title>
</head>
<body>
<?php endif; if ( $display_styles === true ): ?>
	<style type="text/css">
<?php if ( $full === true ): ?>
		body {
			font-family: Tahoma,Arial,sans-serif;
			font-size: 12px;
			margin: 10px;
		}
<?php endif; ?>
		.error {
			padding: 10px;
			margin-bottom: 10px;
			background-color: #EEEEEE;
			border: 1px #CCCCCC solid;
		}
		.error .part {
			margin-bottom: 10px;
		}
		.error .last {
			margin-bottom: 0;
		}
		.error .part .title {
			float: left;
			width: 75px;
			font-weight: bold;
		}
		.error .part .data {
			float: left;
		}
		pre {
			margin: 10px 0 0;
		}
		.clear {
			clear: both;
			height: 0;
			font-size: 0;
			line-height: 0;
		}
	</style>
<?php endif; ?>
	<div class="error">
		<div class="part">
			<div class="title">Type:</div>
			<div class="data"><?php echo $type; ?></div>
			<div class="clear"></div>
		</div>
		<div class="part">
			<div class="title">Message:</div>
			<div class="data"><?php echo $message; ?></div>
			<div class="clear"></div>
		</div>
		<div class="part">
			<div class="title">File:</div>
			<div class="data"><?php echo $file; ?></div>
			<div class="clear"></div>
		</div>
		<div class="part">
			<div class="title">Line:</div>
			<div class="data"><?php echo $line; ?></div>
			<div class="clear"></div>
		</div>
		<div class="part last">
			<div class="title">Backtrace:</div>
			<div class="clear"></div>
			<pre><?php debug_print_backtrace(); ?></pre>
		</div>
	</div>
<?php if ( $full === true ): ?>
</body>
</html>
<?php endif; ?>