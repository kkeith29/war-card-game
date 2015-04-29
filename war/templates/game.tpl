	<div id="game" style="width: <?php echo ( count( $players ) * 200 ); ?>px">
		<h1>War</h1>
		<div id="menu">
			<div class="links">
				<a class="link" href="<?php echo $base_url; ?>index.php?action=reset">Reset Game</a>
				<a class="link" href="<?php echo $base_url; ?>index.php?action=new-war">New War</a>
<?php if ( $show == 'battle' || $show == 'stats' ): ?>
				<a class="link" href="<?php echo $base_url; ?>index.php?show=battle-all">Show All</a>
<?php endif; if ( $show == 'battle-all' || $show == 'stats' ): ?>
				<a class="link" href="<?php echo $base_url; ?>index.php?show=battle&amp;id=1">Show One</a>
<?php endif; ?>
				<a class="link last" href="<?php echo $base_url; ?>index.php?show=stats">Stats</a> 
			</div>
		</div>
<?php if ( $show == 'battle' || $show == 'battle-all' ): ?>
		<div id="scores">
			<h2>Scores</h2>
<?php $c = count( $players ); $i = 1; foreach( $players as $p_id => $player ): ?>
			<div class="score<?php if ( $i == $c ): ?> last<?php endif; ?>">
				<div class="name"><?php echo $player->get_name(); ?></div>
<?php if ( $show == 'battle-all' || $scores == false ): ?>
				<div class="number"><?php echo $player->card_count(); ?></div>
<?php elseif ( $show == 'battle' ): ?>
				<div class="number"><?php echo $scores[$p_id]; ?></div>
<?php endif; ?>
			</div>
<?php $i++; endforeach; ?>
			<div class="clear"></div>
		</div>
<?php endif; if ( $show == 'battle' || $show == 'battle-all' ): if ( $show == 'battle' && $prev_battle !== false ): ?>
		<a id="prev-battle" href="<?php echo $base_url; ?>index.php?show=battle&amp;id=<?php echo $prev_battle; ?>">Previous Battle</a>
<?php endif; ?>
		<div id="battles">
<?php $bc = count( $battles ); $bc_i = 1; foreach( $battles as $b_id => $battle ): ?>
			<div class="battle<?php if ( $bc_i == $bc ): ?> last<?php endif; ?>">
				<div class="data<?php if ( isset( $battle['war'] ) ): ?> war<?php endif; ?>">Battle <?php echo $b_id; if ( isset( $battle['war'] ) ): ?><div class="war_data">War <?php echo $battle['war']; ?></div><?php endif; ?></div>
				<div class="cards">
<?php $cc = count( $battle['cards'] ); $ci = 1; foreach( $battle['cards'] as $cards ): $cc_c = count( $cards ); $cc_i = 1; foreach( $cards as $p_id => $card ): ?>
					<div class="card<?php if ( $cc == $ci && $battle['winner']->get_id() == $p_id ): ?> winner<?php endif; if ( $cc_i == $cc_c ): ?> last<?php endif; ?>">
						<img src="assets/images/cards/<?php echo $suit_directories[$card->get_suit()]; ?>/<?php echo $rank_files[$card->get_rank()]; ?>.png" alt="<?php echo $card->get_name(); ?>" />
					</div>
<?php $cc_i++; endforeach; ?>
					<div class="clear"></div>
<?php $ci++; endforeach; ?>
				</div>
<?php if ( isset( $battle['lost'] ) ): foreach( $battle['lost'] as $loser ): ?>
				<div class="lost"><?php echo $loser->get_name(); ?> has lost the game</div>
<?php endforeach; endif; if ( isset( $battle['won'] ) ): ?>
				<div class="won"><?php echo $battle['won']->get_name(); ?> has won the game</div>
<?php endif; ?>
			</div>
<?php $bc_i++; endforeach; ?>
		</div>
<?php if ( $show == 'battle' && $next_battle !== false ): ?>
		<a id="next-battle" href="<?php echo $base_url; ?>index.php?show=battle&amp;id=<?php echo $next_battle; ?>">Next Battle</a>
<?php endif; elseif ( $show == 'stats' ): ?>
		<div id="stats">
			<div class="stat">
				<div class="label">Winner</div>
				<div class="data"><?php echo $winner->get_name(); ?></div>
				<div class="clear"></div>
			</div>
			<div class="stat">
				<div class="label">Battles</div>
				<div class="data"><?php echo $battles; ?></div>
				<div class="clear"></div>
			</div>
<?php foreach( array( 1=>'Single',2=>'Double',3=>'Triple',4=>'Quadruple' ) as $level => $name ): if ( !isset( $wars[$level] ) ): continue; endif; ?>
			<div class="stat">
				<div class="label"><?php echo $name; ?> Wars</div>
				<div class="data"><?php echo $wars[$level]; ?></div>
				<div class="clear"></div>
			</div>
<?php endforeach; ?>
		</div>
<?php endif; ?>
	</div>
