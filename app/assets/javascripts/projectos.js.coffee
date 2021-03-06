# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

# MENU
scrollIntervalID = undefined
stickIt = undefined
menuactivo = undefined

# MODAL
modal = {}

teste = ->
  alert "test-coffee"

# FUNCAO menuactivo ( Sendo chamado do html nao reconhece o valor do parametro )
menuActivo = ->
  p = String(location).indexOf(document.getElementById("nome_paguina").innerHTML)
  #alert 'pag:' +  document.getElementById("nome_paguina").innerHTML
  if p > 0
    $('#a3').css 'color', 'black'

# DOCUMENT READY (onload/change) - No final deste doc existe a chamada a var func ready
ready = ->
  # Stiki Menu - Necessario adicionar o clone no carregamento da pag, para a existir na DOM
  $('.menu').addClass('original').clone().insertAfter('.menu').addClass('cloned').css('position', 'fixed').css('top', '0').css('margin-top', '0').css('z-index', '500').removeClass('original').hide()

  # MENU: Chama a funcao que ja tem os elementos carregados na DOM
  scrollIntervalID = setInterval(stickIt, 10)

  menuActivo()

  # AREA 2 - COLUNA 1 e 2 -------------------------------- image click
  $('#foto_area2_1').click ->
     # Troca VISIBILIDADE TAMANHO e POSICAO
     $('#foto_area2_1e').css 'visibility', 'visible'
     $('#foto_area2_1e').css 'width', '100%'
     $('#foto_area2_1e').css 'height', '100%'
     $('#foto_area2_1e').css 'float', 'right'

     $('#body-img-pa2_1').css 'min-width', '190px'
     $('#body-img-pa2_1').css 'min-height', '270px'
     #$('#body-img-pa2_1e').css 'min-width', '190px'
     #$('#body-img-pa2_1e').css 'min-height', '270px'
     $('#foto_area2_1').css 'visibility', 'hidden'  #hidden
     $('#foto_area2_1').css 'float', 'right'
     $('#foto_area2_1').css 'margin-top', '0%'
     $('#foto_area2_1').css 'width', '0px'
     $('#foto_area2_1').css 'height', '0px'
     return

  $('#foto_area2_1e').click ->
     $('#foto_area2_1').css 'visibility', 'visible'
     $('#foto_area2_1').css 'width', '40%'
     $('#foto_area2_1').css 'height', '60%'
     $('#foto_area2_1').css 'float', 'right'
     $('#body-img-pa2_1').css 'min-width', '190px'
     $('#body-img-pa2_1').css 'min-height', '270px'

     $('#foto_area2_1e').css 'visibility', 'visible' #hidden
     $('#foto_area2_1e').css 'float', 'left'
     $('#foto_area2_1e').css 'margin-top', '0%'
     $('#foto_area2_1e').css 'width', '0px'
     $('#foto_area2_1e').css 'height', '0px'
     return

  $('#foto_area2_2').click ->
     $('#foto_area2_2e').css 'visibility', 'visible'
     $('#foto_area2_2e').css 'width', '100%'
     $('#foto_area2_2e').css 'height', '100%'
     $('#foto_area2_2e').css 'float', 'left'
     $('#body-img-pa2_2').css 'min-width', '190px'
     $('#body-img-pa2_2').css 'min-height', '270px'
     #$('#body-img-pa2_2e').css 'min-width', '190px'
     #$('#body-img-pa2_2e').css 'min-height', '270px'

     $('#foto_area2_2').css 'visibility', 'visible'  #hidden
     $('#foto_area2_2').css 'float', 'left'
     $('#foto_area2_2').css 'margin-top', '0%'
     $('#foto_area2_2').css 'width', '0px'
     $('#foto_area2_2').css 'height', '0px'
     return

  $('#foto_area2_2e').click ->
     $('#foto_area2_2').css 'visibility', 'visible'
     $('#foto_area2_2').css 'width', '40%'
     $('#foto_area2_2').css 'height', '60%'
     $('#foto_area2_2').css 'float', 'left'
     $('#body-img-pa2_2').css 'min-width', '190px'
     $('#body-img-pa2_2').css 'min-height', '270px'

     $('#foto_area2_2e').css 'visibility', 'visible' #hidden
     $('#foto_area2_2e').css 'width', '0px'
     $('#foto_area2_2e').css 'height', '0px'
     $('#foto_area2_2e').css 'float', 'left'
     $('#foto_area2_2e').css 'margin-top', '0%'
     return
  # AREA 2 - COLUNA 1 e 2 -------------------------------------- FIM


  # Muda a dimensao da MODAL para area 1
  $('.foto_area1').click ->
    modal.hide()
    $('.dialog').css 'width', '430px'
    $('.dialog').css 'height', '500px'
    $('.dialog').css 'margin', '0'
    $('.dialog').css 'margin-top', '90px'
    $('.dialog').css 'margin-left', '5px'

  # Muda a dimensao da MODAL para area 3
  $('.foto_area3').click ->
    modal.hide()
    $('.dialog').css 'width', '480px'
    $('.dialog').css 'height', '320px'
    $('.dialog').css 'margin', 'auto'

  # Chamar a MODAL
  $('.dialog-open').click ->
    modal.id = '#dialog-' + @id
    $('#overlay').fadeIn()
    $(modal.id).fadeIn()
    return
  # Fecha a MODAL
  $('.ok-dialog').click ->
    modal.hide()
    return
  $('#overlay').click ->
    if $(modal.id).hasClass('modal')
    else
      modal.hide()
    return
  $('.dialog').click ->
    event.stopPropagation()
    return
  # AREA 1 COLUNA 1 ------------------------- FIM 


  # DENTRO DA MODAL ------------------------------------- hover imagem
  $('.boxgrid.slidedown').hover (->
    $('.cover', this).stop().animate { top: '-260px' },
      queue: false
      duration: 300
    return
  ), ->
    $('.cover', this).stop().animate { top: '0px' },
      queue: false
      duration: 300
    return

  $('.boxgrid.slideright').hover (->
    $('.cover', this).stop().animate { left: '325px' },
      queue: false
      duration: 300
    return
  ), ->
    $('.cover', this).stop().animate { left: '0px' },
      queue: false
      duration: 300
    return

  $('.boxgrid.thecombo').hover (->
    $('.cover', this).stop().animate {
      top: '260px'
      left: '325px'
    },
      queue: false
      duration: 300
    return
  ), ->
    $('.cover', this).stop().animate {
      top: '0px'
      left: '0px'
    },
      queue: false
      duration: 300
    return

  $('.boxgrid.peek').hover (->
    $('.cover', this).stop().animate { top: '90px' },
      queue: false
      duration: 160
    return
  ), ->
    $('.cover', this).stop().animate { top: '0px' },
      queue: false
      duration: 160
    return
  $('.boxgrid.captionfull').hover (->
    $('.cover', this).stop().animate { top: '160px' },
      queue: false
      duration: 160
    return
  ), ->
    $('.cover', this).stop().animate { top: '260px' },
      queue: false
      duration: 160
    return
  $('.boxgrid.caption').hover (->
    $('.cover', this).stop().animate { top: '260px' },
      queue: false
      duration: 160
    return
  ), ->
    $('.cover', this).stop().animate { top: '340px' },
      queue: false
      duration: 160
    return
  # DENTRO DA MODAL ------------------------------------- FIM


# FUNCAO MODAL
modal.hide = ->
  $('#overlay').fadeOut()
  $('.dialog').fadeOut()
  return

# FUNCAO PARA O MENU
stickIt = ->
  coordsOrgElement = undefined
  leftOrgElement = undefined
  orgElement = undefined
  orgElementPos = undefined
  orgElementTop = undefined
  widthOrgElement = undefined
  marcador = undefined
  orgElementPos = $('.original').offset()
  orgElementTop = orgElementPos.top
  orgElementPos = $('.marcador').offset()
  marcador = orgElementPos.top

  if $(window).scrollTop() >= orgElementTop
    orgElement = $('.original')
    coordsOrgElement = orgElement.offset()
    leftOrgElement = coordsOrgElement.left
    widthOrgElement = orgElement.css('width')
    $('.cloned').css('left', leftOrgElement + 'px').css('top', 0).css('width', widthOrgElement).show()
    $('.original').css 'visibility', 'hidden'
    if $(window).scrollTop() > marcador
      #$('.desc_posicao').css 'visibility', 'visible'
    else
      #$('.desc_posicao').css 'visibility', 'hidden'
  else
    $('.cloned').hide()
    $('.original').css 'visibility', 'visible'
#---
# generated by js2coffee 2.0.1
#
# ---------------------------------------------------------------------------------------
#
# Maneira de garantir a funcionalidade $(document).ready() do js, exemplo codepen. Depois
# eh so passar de js para coffee com o js2coffee
# ---------------------------------------------------------------------------------------
$(document).ready(ready)
$(document).on('page:change', ready)


# NESTE SITIO ESTE CODIGO NUNCA FUNCIONARAH (so dentro da var ready = ->)
#if $(window).scrollTop() >= 0  
#  $('.original').click -> alert " orig " +  $(window).scrollTop() + " marcador " +  marcador
#  $('.cloned').click -> alert " clone " +  $(window).scrollTop() + " marcador " +  marcador
#  $('.menu').click -> alert " menu "+ $(window).scrollTop() + " marcador " +  marcador
#return
