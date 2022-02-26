$(document).ready(() => {

    $("#consultar").on('click',() => {
        
        $.get('consulta.html', data => {
            $('#pagina1').html(data)

            $.ajax({
                type: 'GET',
                url: 'Service.php',
                data: 'acao=recuperar',
                success: dado => {
                    let dados = JSON.parse(dado)
                    $.each(dados, function(index, value){
                        $('#table').append(`<tr id="deletar_${value.id}"><td>${value.ano}/${value.mes}/${value.dia}</td><td>${value.tipo}</td><td>${value.descricao}</td><td>${value.valor}</td><td><a onclick="deletar(${value.id})"><i class="fa-solid fa-trash"></i></a></td></tr>`)
                    })
                },
                error: erro => {
                    console.log(erro)
                }   
            })
        })

        

       
        
    })

    $("#cadastrar").on('click',() => {
        
        $.get('index.html', data => {
            $('#pagina1').html(data)
        })
        
    })

    $('#adicionar').on('click', () => {
        let ano = $('#ano').val()
        let mes = $('#mes').val()
        let dia = $('#dia').val()
        let tipo = $('#tipo').val()
        let descricao = $('#descricao').val()
        let valor = $('#valor').val()
    

        let obj = {
            ano : ano,
            mes : mes,
            dia : dia,
            tipo : tipo,
            descricao : descricao,
            valor : valor,
            acao : 'gravar'
        }
      
        

        if(ano == '' || mes == '' || dia == '' || tipo == '' || descricao == '' || valor == ''){
            alert('Erro! Preencha todos os campos!')
        }else if(dia > 32){
            alert('Dia invalido!')

        }else{
            $.ajax({
                    type: 'POST',
                    url: 'Service.php',
                    data: obj
                }).done(()=>{
                    alert('Registrado com sucesso!')
                    $('#ano').val('')
                    $('#mes').val('')
                    $('#dia').val('')
                    $('#tipo').val('')
                    $('#descricao').val('')
                    $('#valor').val('')          
                })
        }

    
    })

    $('#pesquisar').on('click', () => {
        let ano = $('#ano').val()
        let mes = $('#mes').val()
        let dia = $('#dia').val()
        let tipo = $('#tipo').val()
        let descricao = $('#descricao').val()
        let valor = $('#valor').val()  
        
        let obj = {
            ano : ano,
            mes : mes,
            dia : dia,
            tipo : tipo,
            descricao : descricao,
            valor : valor,
            acao : 'pesquisar'
        }

        if(ano){
            
            $.ajax({
                type: 'GET',
                url: 'Service.php',
                data: obj,
                success: dado  => {
                    let dados = JSON.parse(dado)
                    if(dados == ''){
                        alert('Nada encontrado!')
                        console.log(dados)
                    }else{
                        
                        $('#table').html('')
                        $.each(dados, function(index, value){               
                            $('#table').append(`<tr id="deletar_${value.id}"><td>${value.ano}/${value.mes}/${value.dia}</td><td>${value.tipo}</td><td>${value.descricao}</td><td>${value.valor}</td><td><a onclick="deletar(${value.id})"><i class="fa-solid fa-trash"></i></a></td></tr>`)
                        })
                    }
                },
                error: erro => {
                    console.log(erro)
                }   
            })
        }else{
            alert('Campo ano é obrigatório')
        }
                            
        
    })  

})

function deletar(id) {

    $.ajax({
        type: 'POST',
        url: 'Service.php',
        data: 'acao=excluir&id='+id,
        success: dados => {
            alert('Despesa excluída com sucesso!')
            $('#deletar_'+id).html('')
        },
        error: erro => {
            console.log(erro)
        }   
    })   

}