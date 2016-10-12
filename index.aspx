<%@ Page Title="Portfolio" Language="VB" AutoEventWireup="false" Debug="true"%>
<head runat="server">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="Shortcut Icon" href="favicon.ico" />
<script src="JS/jquery-1.11.1.min.js"></script>
<link rel="stylesheet" href="css/style.css">
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script>

    $(document).ready(function () {
        $('#Home').click(function () {
            $('html,body').animate({ scrollTop: $("#Intro").offset().top }, 800);
        });
        $('#NavProgramming').click(function () {
            $('html,body').animate({ scrollTop: $("#Programming").offset().top }, 800);
        });
        $('#NavDesign').click(function () {
            $('html,body').animate({ scrollTop: $("#Design").offset().top }, 800);
        });
        $('#NavUX').click(function () {
            $('html,body').animate({ scrollTop: $("#UX").offset().top }, 800);
        });
        $('#NavBusinessTechnology').click(function () {
            $('html,body').animate({ scrollTop: $("#BusinessTechnology").offset().top }, 800);
        });
        $('#NavContact').click(function () {
            $('html,body').animate({ scrollTop: $("#footer").offset().top }, 800);
        });

    });

    $(window).scroll(function (e) {
        $el = $('.SectionTitle');
        if ($("#Programming").scrollTop() == true && $el.css('position') != 'fixed') {
            $('.SectionTitle').css({ 'position': 'fixed', 'top': '0px' });
        }
        if ($(this).scrollTop() < 400 && $el.css('position') == 'fixed') {
            $('.SectionTitle').css({ 'position': 'static', 'top': '0px' });
        }
        
    });




</script>
</head>
<body>
<form id="form1" runat="server">
<div id="header" align="center">
<div id="nav">
<ul>
<li><a id="Home" href="javascript:void(0)" title=""><img id="HomeButton" src="Images/navLogo.png" alt="Home Logo"/></a></li> 
<li><a id="NavProgramming" href="javascript:void(0)" title="">Programming</a></li>
<li><a id="NavDesign" href="javascript:void(0)" title="">Design</a></li>
<li><a id="NavUX" href="javascript:void(0)" title="">User Experience</a></li>
<li><a id="NavBusinessTechnology" href="javascript:void(0)" title="">Business Technology</a></li>
<li><a id="NavContact" href="javascript:void(0)" title=""> Contact</a></li>
</ul>
</div>
</div>
<div id="Intro">

</div>


<div id="Programming">
<h1 id="ProgrammingTitle" class="SectionTitle">Programming & Web Development</h1>
 <div id="Radiate" class="programming">

<a href="http://digicomm.lvc.edu/wordpress/" target="_blank"><img id="RadiateIMG" src="Images/Radiate.png" class="rightimage" /></a>
<div  id="RadiateDescription" class="leftdesc">
<h1 class="project">Radiate</h1>
<p>Radiate was my group capstone project in which I worked with a small group of UX designers, business analysts, and two other developers. Radiate is a platform form undiscovered artists to share their work to a community of supporters. Being on the development team for this project I used helped develop the back-end PHP and the front-end/Wordpress side of the site.<br />
 <br />
 <a href="http://digicomm.lvc.edu/wordpress/" target="_blank">Link to Radiate <b>CURRENTLY DOWN</b></a></p>
 <ul>
 <li class="skillsused">HTML/CSS</li>
 <li class="skillsused">PHP</li>
 <li class="skillsused">JAVASCRIPT/JQUERY</li>
 <li class="skillsused">Wordpress</li>
 </ul>
</div>

<center>
<hr class="projecthr"/>
</center>
</div>
<div id="MyLVC" class="programming">
<a href="http://www.lvc.edu/mylvc/index.aspx" target="_blank"><img id="MyLVCIMG" src="Images/MyLVC.png"class="leftimage" /></a>
<div  id="MyLVCDescription" class="rightdesc">
<h1 class="project">MyLVC</h1>
<p>MyLVC  is part of the Lebanon Valley College website where students and professors can go to view their campus information. This information could be any number of things because this is the part of the
website that campus email, class information, and class selection is housed. In this project I and a team redesigned MyLVC to be more user friendly. By using information gathered from students, faculty, and our analytics system, 
we determined which features we should keep, which needed to be added, and which items were no longer of use. I was one of the most active web developers working on this project because I was not only in charge of making the website responsive, but
 I also was part of the web design team. While programming this site. <br />
 <br />
 <a href="http://www.lvc.edu/mylvc/index.aspx" target="_blank">Link to MyLVC.</a></p>
 <ul>
 <li class="skillsused">HTML/CSS</li>
 <li class="skillsused">ASP.NET</li>
 <li class="skillsused">JAVASCRIPT/JQUERY</li>
 <li class="skillsused">VISUAL BASIC</li>
 </ul>
</div>


<center>
<hr class="projecthr"/>
</center>
</div>
 <div id="MyLVCFeedback" class="programming">

<a href="http://www.lvc.edu/mylvc/Feedback_Form.aspx" target="_blank"><img id="MyLVCFeedbackIMG" src="Images/MyLVCFeedback.png" class="rightimage" /></a>
<div  id="FeedbackDescription" class="leftdesc">
<h1 class="project">MyLVC Feedback Form</h1>
<p>This page was created to give MyLVC's users a chance to tell us what they liked or didn't like abou the new MyLVC along with the ability to report bugs the site has. I programmed the user's input to be sent into a database for future
 reference using ASP and MySQL. I also repurposed an already existing Visual Basic file to sent the user's input to the user's email as confirmation that the form sent and to our programming team so that we could take the user's feedback 
 and make changes to the site accordingly.<br />
 <br />
 <a href="http://www.lvc.edu/mylvc/Feedback_Form.aspx" target="_blank">Link to MyLVC Feedback Form.</a></p>
 <ul>
 <li class="skillsused">HTML/CSS</li>
 <li class="skillsused">ASP.NET</li>
 <li class="skillsused">JAVASCRIPT/JQUERY</li>
 <li class="skillsused">VISUAL BASIC</li>
 </ul>
</div>

<center>
<hr class="projecthr"/>
</center>
</div>

<div id="DeathLeague" class="programming">

<a href="deathleague/index.html" target="_blank"><img id="DeathLeagueImage" src="Images/DeathLeague.png" class="leftimage" /></a>
<div  id="DeathLeagueDescription" class="rightdesc">
<h1 class="project">The Death League</h1>
<p>This was a group project, where another programmer and I (accompanied by two designers) designed and programmed a site to tell the story of an old club that used to be on campus. This site features a one page scroll navigation along with multiple different jQuery and JavaScript functions that help the site afford easy navigation and add to it's ability to tell a the story of the once mighty League of Death that reigned over LVC with an iron fist<br />
 <br />
 <p>*(Our Professor prefered things be done for Firefox and we did not prepare a Google chrome version of certain aspects of the site, so I recommend viewing the site with Firefox)</p><br />
 <a href="deathleague/index.html" target="_blank">Link to the website.</a></p>
 <ul>
 <li class="skillsused">HTML/CSS</li>
 <li class="skillsused">JAVASCRIPT/JQUERY</li>

 </ul>
</div>

<center>
<hr class="projecthr"/>
</center>
</div>
 <div id="Game" class="programming">

<a href="http://digicom.lvc.edu/DCOM271/DCOM271-Spring2015/joe/Game/Game.aspx" target="_blank"><img id="GameImage" src="Images/Game.png"  /></a>
<div  id="GameDescription" >
<h1 class="project">Academic Video Game</h1>
<p>This was a project assigned to me by one of my professors, I was to contruct a website "for the greater good". I had been working on a 2D-sidescroller for a while and wanted to see if I could repurpose it somehow to meet this 
projects requirements. My group agreed that it was a good idea so we pitched it to the professor and he also agreed. The requirements stated we need to use two seperate databases that featured a certain number of columns and rows. 
The game was coded using HTML's canvas element and manipulating objects stored in an array using JavaScript. One database stored the player's high score if they wished to submit it at the end of their game, and the other stored interesting 
space facts that were designed to teach children about space, thus satisfying "the greater good" requirement. I used jQuery.Animate functions to have the facts appear and they are stylized to match the level you are playing's background. 
I coded all of the game while other members focused on design elements, although I did design the small monsters, laser, and I also had final say on all design pieces for the game.<br />
 <br />
 <a href="http://digicom.lvc.edu/DCOM271/DCOM271-Spring2015/joe/Game/Game.aspx" target="_blank">Link to the Game.</a></p>
 <ul>
 <li class="skillsused">HTML/CSS</li>
 <li class="skillsused">ASP.NET</li>
 <li class="skillsused">JAVASCRIPT/JQUERY</li>
 <li class="skillsused">VISUAL BASIC</li>

 </ul>
</div>
<br>
<center>
<hr class="projecthr"/>
</center>
</div>

</div>


<div id="Design">
<h1 id="DesignTitle" class="SectionTitle">Web & Graphic Design</h1>

<div id="Poem" class="design">
<img id="PoemImage" src="Images/Alice.jpg" />
<div  id="PoemDescription">
<h1 class="project">Poem Brought to Life</h1>
<p>This project was designed for us to bring a poem to life via the use of Adobe Photoshop. I chose the Jabberwocky poem by Lewis Carrol, and brought to life the line "Beware the Jabberwock, my son!
The jaws that bite, the claws that catch!
Beware the Jubjub bird, and shun
The frumious Bandersnatch"<br />
 <br />
 
 <ul>
 <li class="skillsused">Adobe Photoshop</li>
 <li class="skillsused">Adobe Illustrator</li>
</ul>
</div>

<center>

<hr class="projecthr"/>
</center>
</div>

<div id="Poster" class="design">
<img id="PosterImage" src="Images/9-11.jpg" />
<div  id="PosterDescription">
<h1 class="project">Poster for a Tragedy</h1>
<p>In this project I was told to make a poster for a tragedy. I chose to depict the events of 9/11 because I felt like this was the
most recent tragedy. I made the following design by taking a picture of the towers and then I placed a picture of the United States flag on top of it. Next I removed the white stripes to show the picture
of the towers in place of the stripes. My last addition to the project was adding the text and I will foundation's logo to the image.<br /> 
 <br />
 
 <ul>
 <li class="skillsused">Adobe Photoshop</li>
 <li class="skillsused">Adobe Illustrator</li>
</ul>
</div>

<center>
<hr class="projecthr"/>
</center>
</div>

<div id="Door" class="design">
<img id="DoorImage" src="Images/door.jpg" />
<div  id="DoorDescription">
<h1 class="project">Doorways to Diversity</h1>
<p>The Doorways to Diversity project was by far my favorite design piece I have made. The assignment was to meet with a client I had chose on campus and discuss what content they would like to be placed on their door poster. This door poster was as large as the door itself and required physical measuring to get the dimensions of the project correct. My door was a Portuguese themed door, using pictures given to me by my client. This project was also a competition between me and another student and when it was finished my design was chosen by the client. This door along with all of the other students' doors was shown in an event on campus<br />
 <br />
 
 <ul>
 <li class="skillsused">Adobe Photoshop</li>
 <li class="skillsused">Adobe Illustrator</li>
</ul>
</div>

<center>
<hr class="projecthr"/>
</center>
</div>

<div id="Wine" class="design">
<img id="WineImage" src="Images/wine.jpg" />
<div  id="WineDescription">
<h1 class="project">Sparta Hard Wine</h1>
<p>This design was part of a larger project where I had to create a wine vineyard. I created a wine vineyard named "Sparta Hard Wine" which was a wine with a Spartan theme, of course with this theme I had to make the wine "hard" as well. The logo on the wine itself was also used as my vineyard's logo and branding. The text was designed to match the logo as well as possible and the word "Sparta" was input in greek on the bottles because it is the name of the vineyard.<br />
 <br />
 
 <ul>
 <li class="skillsused">Adobe Photoshop</li>
 <li class="skillsused">Adobe Illustrator</li>
</ul>
</div>

<center>
<hr class="projecthr"/>
</center>
</div>
</div>


<div id="UX">
<h1 id="UXTitle" class="SectionTitle">User Experience</h1>
<h2 style="margin-left:2.5%;">Under Contruction</p>
</div>


<div id="BusinessTechnology">
<h1 id="BusinessTechnologyTitle" class="SectionTitle">Business Technology</h1>
<h2 style="margin-left:2.5%;">Under Contruction</p>
</div>


<div id="footer">

<div id="socialmedia">
<h1 id="socialtitle">Social Media</h1>
<a class="social" href="https://www.linkedin.com/profile/view?id=289686468&trk=nav_responsive_tab_profile_pic" target="_blank"><img id="linkdin" class="socialimage" src="Images/linkedin.png" title="LinkedIn">Connect with me on LinkedIn</a>
<a class="social" href="https://www.facebook.com/joe.dangelo.12" target="_blank"><img id="facebook" src="Images/facebook.png" class="socialimage" title="Facebook">Add me on Facebook</a>
<a class="social" href="https://twitter.com/Captain_DAngelo" target="_blank"><img id="twitter" class="socialimage" src="Images/twitter.png" title="Twitter">Follow me on Twitter</a>
<a class="social" href="mailto:jd004@lvc.edu" target="_blank"><img id="Email" class="socialimage" src="Images/email.png" title="Email Me">jd004@lvc.edu</a>
</div>
</div>
</form>
</body>