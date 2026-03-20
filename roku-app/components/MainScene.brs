sub init()
    m.webView = m.top.findNode("mainWebView")
    
    ' Trava o tamanho em HD para compatibilidade
    m.webView.width = 1280
    m.webView.height = 720
    
    ' LINK DE TESTE (Google)
    m.webView.url = "https://www.google.com"
    
    ' Forca visibilidade e foco
    m.webView.visible = true
    m.webView.setFocus(true)
    
    ' Inicia o carregamento
    m.webView.control = "load"
end sub

function onKeyEvent(key as String, press as Boolean) as Boolean
    if press
        if key = "back"
            if m.webView.canGoBack
                m.webView.back = true
                return true
            end if
        end if
    end if
    return false
end function
