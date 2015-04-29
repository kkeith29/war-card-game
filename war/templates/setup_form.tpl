	<div id="setup-form">
		<noscript>
			<h2 id="no-javascript">Javascript is disabled</h2>
		</noscript>
		<h1>War</h1>
<?php if ( count( $errors ) > 0 ): ?>
		<div id="errors">
			<h2>Errors</h2>
			<ul>
<?php foreach( $errors as $error ): ?>
				<li><?php echo $error; ?></li>
<?php endforeach; ?>
			</ul>
		</div>
<?php endif; ?>
		<form action="<?php echo $base_url; ?>index.php" method="post" accept-charset="utf-8">
			<div class="form">
				<div class="hidden">
					<input type="hidden" name="player_count" id="player-count" value="<?php echo $player_count; ?>" />
				</div>
				<div id="players">
					<h2>Players<a id="player-add" href="">Add</a></h2>
					<div class="players">
<?php for( $i=1;$i <= $player_count;$i++ ): ?>
						<div class="player<?php if ( $i == 1 ): ?> first<?php endif; if ( $i == $player_count ): ?> last<?php endif; ?>">
<?php if ( $i > 1 ): ?>
							<a class="remove" href="">Remove</a>
<?php endif; ?>
							<h3>Player <?php echo $i; ?></h3>
							<div class="field">
								<div class="label l_1"><label for="players-<?php echo $i; ?>-name">Name</label></div>
								<div class="element e_1"><input type="text" class="input_text" name="players[<?php echo $i; ?>][name]" id="players-<?php echo $i; ?>-name" value="<?php if ( isset( $_POST['players'][$i]['name'] ) && $_POST['players'][$i]['name'] !== '' ): echo htmlentities( $_POST['players'][$i]['name'] ); endif; ?>" /></div>
								<div class="clear"></div>
							</div>
						</div>
<?php endfor; ?>
					</div>
				</div>
				<div id="config-options">
					<h2>Config Options</h2>
					<div class="options">
						<div class="field">
							<div class="label">Face-down cards in War</div>
							<div class="element">
								<select class="select" name="face_down_cards">
<?php foreach( $face_down_cards as $value => $label ): ?>
									<option value="<?php echo $value; ?>"<?php if ( isset( $_POST['face_down_cards'] ) && $_POST['face_down_cards'] == $value ): ?> selected="selected"<?php endif; ?>><?php echo $label; ?></option>
<?php endforeach; ?>
								</select>
							</div>
						</div>
<?php /*
						<div class="field">
							<div class="label">Use Jokers?</div>
							<div class="element">
								<select class="select" name="use_jokers">
<?php foreach( $use_jokers as $value => $label ): ?>
									<option value="<?php echo $value; ?>"<?php if ( isset( $_POST['use_jokers'] ) && $_POST['use_jokers'] == $value ): ?> selected="selected"<?php endif; ?>><?php echo $label; ?></option>
<?php endforeach; ?>
								</select>
							</div>
						</div>
*/ ?>
					</div>
				</div>
				<div class="clear"></div>
				<div id="submit">
					<input type="submit" class="input_submit" name="submit" value="Start War" />
				</div>
			</div>
		</form>
	</div>