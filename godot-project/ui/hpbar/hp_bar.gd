extends ProgressBar


func set_progress(progress:float):
	$Bar.region_rect.size.x = progress * initial_w
	print("progress:", progress)
	print("region_rect:", $Bar.region_rect)
