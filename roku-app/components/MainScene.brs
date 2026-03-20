sub init()
    m.webView = m.top.findNode("mainWebView")
    
    ' Configura o link
    m.webView.url = "https://smart-stream-visions.lovable.app"
    
    ' Ajusta o tamanho para a tela real da TV
    deviceInfo = CreateObject("roDeviceInfo")
    displaySize = deviceInfo.GetDisplaySize()
    m.webView.width = displaySize.w
    m.webView.height = displaySize.h
    
    ' Forca o carregamento e da foco
    m.webView.visible = true
    m.webView.setFocus(true)
    
    ' Alguns modelos precisam desse comando explicito
    m.webView.control = "load"
    
    print "Iniciando carregamento de: " + m.webView.url
end sub

function onKeyEvent(key as String, press as Boolean) as Boolean
    if press
        print "Tecla pressionada: " + key
        if key = "back"
            if m.webView.canGoBack
                m.webView.back = true
                return true
            end if
        end if
    end if
    return false
end function
