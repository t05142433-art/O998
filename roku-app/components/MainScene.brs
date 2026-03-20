sub init()
    m.webView = m.top.findNode("mainWebView")
    
    ' Ajusta o tamanho para a tela real
    deviceInfo = CreateObject("roDeviceInfo")
    displaySize = deviceInfo.GetDisplaySize()
    m.webView.width = displaySize.w
    m.webView.height = displaySize.h
    
    ' Configura o link
    m.webView.url = "https://smart-stream-visions.lovable.app"
    
    ' Forca visibilidade e foco
    m.webView.visible = true
    m.webView.setFocus(true)
    
    ' Inicia o carregamento
    m.webView.control = "load"
    
    print "--- TENTANDO CARREGAR SITE ---"
    print "URL: " + m.webView.url
end sub

function onKeyEvent(key as String, press as Boolean) as Boolean
    if press
        print "TECLA: " + key
        if key = "back"
            if m.webView.canGoBack
                m.webView.back = true
                return true
            end if
        end if
    end if
    return false
end function
