
function myFunction()
{
	document.getElementById("menuVous").classList.toggle("show");
}

window.onclick = function(event)
{
	if((event.target.className!='fontawesome-user')&&(event.target.className!='icones')&&(event.target.className!='Vous'))
	{
		var eleMenu = document.getElementsByClassName("elementsMenu");
		var i;
		for(i=0;i<eleMenu.length;i++)
		{
			var element = eleMenu[i];
			if(element.classList.contains('show'))
			{
				element.classList.remove('show');
			}
		}
	}
}

$(document).ready(function(){
		var taille = $('.Vous').innerWidth()/4 +200;
        $("#menuVous").css("right", taille);
		
		var hauteur = $('#nav').innerHeight()-10;
		$("#menuVous").css("top", hauteur);
				
		
		var tailleArrow = $('#menuVous').innerWidth()/3-5;
        $(".arrow").css("margin-left", tailleArrow);
		
		var tailleCV = $('.CV .cont').innerHeight();
		$(".competences .cont").css("height", tailleCV);
		$(".diplomes .cont").css("height", tailleCV);
		
		var tailleLangues = $('.langue .cont').innerHeight();
		$(".formation .cont").css("height", tailleCV);
		$(".experience .cont").css("height", tailleCV);
		
		var tailleLangues = $('.associations .cont').innerHeight();
		$(".benevolat .cont").css("height", tailleLangues);
		$(".projets .cont").css("height", tailleLangues);
		
});


function myDate() {
    document.getElementById("myDate").defaultValue = "cc";
}

