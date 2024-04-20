<script type="text/javascript">
	$(document).ready(function(){
		$('#checkBoxAll').click(function(){
			if($(this).is(":checked")){
				$('.checkBoxItem').prop('checked', true);
			}
			else{
				$('.checkBoxItem').prop('checked', false);
			}
		})
	})
</script>