window.looping = true;
// Maneira correcta de declarar global. O IE da barraca com a declaracao "var n=0;".
window.n = 0;

window.n1 = 0.45;
window.n2 = 0.55;
window.n3 = 1;
window.n4 = 0.85;
window.n5 = 0.5;
window.n6 = 0.70;
window.n7 = 0.85;
window.n8 = 1.05;


var game = new Game();


// Mudar velocidade inline (nao lembra ao diabo)
function startStop() {

	window.looping = !window.looping;

	window.n = window.n + 0.5;

	window.n1 += 0.45;
	window.n2 += 0.55;
	window.n3 += 1;
	window.n4 += 0.85;
	window.n5 += 0.5;
	window.n6 += 0.70;
	window.n7 += 0.85;
	window.n8 += 1.05;
}


function init() {
        if(game.init())
                game.start();
}

/**
 * No caso de nao carregar uma destas imagens, nao mostra as seguintes.
 * Imagens animadas.
 */
var image1 = new function() {
        // Define images
        this.empty = null;
        this.background = new Image();
        
        // Set images src
        this.background.src = "assets/bird1.png";

}


var image2 = new function() {
        // Define images
        this.empty = null;
        this.background = new Image();
        
        // Set images src
        this.background.src = "assets/bird2.png";

}

var image3 = new function() {
        // Define images
        this.empty = null;
        this.background = new Image();
        
        // Set images src
        this.background.src = "assets/book1.png";

}

var image4 = new function() {
        // Define images
        this.empty = null;
        this.background = new Image();
        
        // Set images src mainBg
        this.background.src = "assets/book2.jpg";

}

var image5 = new function() {
        // Define images
        this.empty = null;
        this.background = new Image();
        
        // Set images src
        this.background.src = "assets/interior2.png";

}

var image6 = new function() {
        // Define images
        this.empty = null;
        this.background = new Image();
        
        // Set images src
        this.background.src = "assets/interior1.jpg";

}

var image7 = new function() {
        // Define images
        this.empty = null;
        this.background = new Image();
        
        // Set images src
        this.background.src = "assets/interior3.jpg";

}

var image8 = new function() {
        // Define images
        this.empty = null;
        this.background = new Image();
        
        // Set images src
        this.background.src = "assets/kapa.png";

}

// Fundo para a animacao
var imageBkg = new function() {
        // Define images
        this.empty = null;
        this.background = new Image();
        
        // Set images src mainBg
        this.background.src = "assets/fundo-b-anim.jpg";

}
/**
 * Creates the Drawable object which will be the base class for
 * all drawable objects in the game. Sets up defualt variables
 * that all child objects will inherit, as well as the defualt
 * functions. 
 */
function Drawable() {        
        this.init = function(x, y) {

		// Posicao inicial do movimento esq-dir (fora do ecran)
                this.x_inicial = -316;

		// Posicao do movimento esq-dir: eixo X
                this.x1 = this.x_inicial;
                this.x2 = this.x_inicial;
                this.x3 = this.x_inicial;
                this.x4 = this.x_inicial;

		// Posicao inicial do movimento dir-esq (fora do ecran)
                //this.xde_inicial = 922;
                this.xde_inicial = 1400;

		// Posicao do movimento dir-esq: eixo X
                this.xde1 = this.xde_inicial;
                this.xde2 = this.xde_inicial;
                this.xde3 = this.xde_inicial;
                this.xde4 = this.xde_inicial;


		// Posicao das imagens em movimento no eixo Y. apartir do topo
                this.y = 11;

		// Definicao de altura e largura das imagens animadas
		this.img_alt = 212;
		this.img_lar = 212;
        }

 	// Inicializacao para prototype
        this.canvasWidth = 0;
        this.canvasHeight = 0;
        
        // Define abstract function to be implemented in child objects
        this.draw = function() {
        };
}


/**
 * Creates the Background object which will become a child of
 * the Drawable object. The background is drawn on the "background"
 * canvas and creates the illusion of moving by panning the image.
 */
function Background() {
 
	// Chama a animacao das imagens, incrementa velocidade com window.n
        this.draw = function() {

		// Cria e Anima as imagens: A mais recente sobrepoe-se a mais antiga
		this.draw_fundo(0,0);      // fundo-b-anim.jpg sem movimento

		this.draw_dir2(this.y-8); // book2.jpg
		this.draw_esq2(this.y-8); // interior3.jpg
		this.draw_esq4(this.y-8); // book1.jpg
		this.draw_dir3(this.y-8); // bird1.jpg

		this.draw_dir4(this.y-8); // interior1.jpg
		this.draw_esq3(this.y-8); // bird2.png
		this.draw_dir1(this.y-8); // interior2.png
		this.draw_esq1(this.y-8); // kapa.png          ***


        };

        // Fundo sem movimento (fundo da animacao)
        this.draw_fundo = function(x,y) {
		//Faz a imagem que sem movimento: fundo-b-anim.jpg
		this.context.drawImage(imageBkg.background, x, y-25, 1366, 299);

        };

	// **  ESQ-DIR  ********************************************************************************* ANIMACAO: Eixo X

        // Movimento esq-dir (Implement abstract function)
        this.draw_dir1 = function(y) {

		//Faz a imagem que tem movimento: interior2.jpg
		this.context.drawImage(image5.background, this.x1, y, this.img_lar, this.img_alt);
 
                // Velocidade
                this.x1 += window.n1;
 
                // If the image scrolled off the screen, reset
                if (this.x1 >= this.canvasWidth) this.x1 = this.x_inicial;

        };

        // Movimento esq-dir (Implement abstract function)
        this.draw_dir2 = function(y) {

		//Faz a imagem que tem movimento: Book2.jpg
		this.context.drawImage(image4.background, this.x2, y, this.img_lar, this.img_alt);

                // Velocidade
                this.x2 += window.n2;
 
                if (this.x2 >= this.canvasWidth) this.x2 = this.x_inicial;

        };

        // Movimento esq-dir (Implement abstract function)
        this.draw_dir3 = function(y) {

		//Faz a imagem que tem movimento: Bird1.jpg
		this.context.drawImage(image1.background, this.x3, y, this.img_lar, this.img_alt);

                // Velocidade
                this.x3 += window.n3;

                if (this.x3 >= this.canvasWidth) this.x3 = this.x_inicial;
        };


        // Movimento esq-dir (Implement abstract function)
        this.draw_dir4 = function(y) {

		//Faz a imagem que tem movimento: interior1.jpg
		this.context.drawImage(image6.background, this.x4, y, this.img_lar, this.img_alt);

                // Velocidade
                this.x4 += window.n4;
 
                if (this.x4 >= this.canvasWidth) this.x4 = this.x_inicial;

        };


	// ** DIR_ESQ ********************************************************************************* ANIMACAO: Eixo X

	// movimento dir-esq
        this.draw_esq1 = function(y) {

                this.xde1 -= window.n5;

		//Faz a imagem que tem movimento: kapa.png
                this.context.drawImage(image8.background, this.xde1, y, this.img_lar, this.img_alt);
		
                //this.context.drawImage(image8.background, 500, 15, this.img_lar+90, this.img_alt+90);

                if (this.xde1 <= this.x_inicial) this.xde1 = this.xde_inicial;
        };

	// movimento dir-esq
        this.draw_esq2 = function(y) {

                this.xde2 -= window.n6;

		//Faz a imagem que tem movimento: interior3.jpg
                this.context.drawImage(image7.background, this.xde2, y, this.img_lar, this.img_alt);

                if (this.xde2 <= this.x_inicial) this.xde2 = this.xde_inicial;
        };

	// movimento dir-esq
        this.draw_esq3 = function(y) {

                this.xde3 -= window.n7;

		//Faz a imagem que tem movimento: Bird2.jpg
                this.context.drawImage(image2.background, this.xde3, y, this.img_lar, this.img_alt);

                if (this.xde3 <= this.x_inicial) this.xde3 = this.xde_inicial;

        };

	// movimento dir-esq
        this.draw_esq4 = function(y) {

                this.xde4 -= window.n8;

		//Faz a imagem que tem movimento: book.jpg
                this.context.drawImage(image3.background, this.xde4, y, this.img_lar, this.img_alt);

                if (this.xde4 <= this.x_inicial) this.xde4 = this.xde_inicial;
        };
}


// Set Background to inherit properties from Drawable
Background.prototype = new Drawable();


/**
 * Creates the Game object which will hold all objects and data for
 * the game.
 */
function Game() {
        /*
         * Gets canvas information and context and sets up all game
         * objects. 
         * Returns true if the canvas is supported and false if it
         * is not. This is to stop the animation script from constantly
         * running on older browsers.
         */
        this.init = function() {
                // Get the canvas element
                this.bgCanvas = document.getElementById('background');

 		this.btn = document.getElementById('btnStart');
		this.btn.addEventListener('click', function(event) {startStop();});

                
                // Test to see if canvas is supported
                if (this.bgCanvas.getContext) {
                        this.bgContext = this.bgCanvas.getContext('2d');
                
                        // Initialize objects to contain their context and canvas
                        // information
                        Background.prototype.context = this.bgContext;
                        Background.prototype.canvasWidth = this.bgCanvas.width;
                        Background.prototype.canvasHeight = this.bgCanvas.height;
                        
                        // Initialize the background object
                        this.background = new Background();
                        this.background.init(0,0); // Set draw point to 0,0

                        return true;
                } else {
                        return false;
                }
        };
        
        // Start the animation loop
        this.start = function() {
                animate();
        };
}


/**
 * The animation loop. Calls the requestAnimationFrame shim to
 * optimize the game loop and draws all game objects. This
 * function must be a gobal function and cannot be within an
 * object.
 */
function animate() {
        requestAnimFrame( animate );
	if (window.looping==true){
	 	 game.background.draw();
	} else return

}


/**        
 * requestAnim shim layer by Paul Irish
 * Finds the first API that works to optimize the animation loop, 
 * otherwise defaults to setTimeout().
 */

window.requestAnimFrame = (function(){
        return  window.requestAnimationFrame       || 
                        window.webkitRequestAnimationFrame || 
                        window.mozRequestAnimationFrame    || 
                        window.oRequestAnimationFrame      || 
                        window.msRequestAnimationFrame     || 
                        function(/* function */ callback, /* DOMElement */ element){
                                window.setTimeout(callback, 1000 / 60);
                        };
})();
