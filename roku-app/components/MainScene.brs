sub init()
    m.webView = m.top.findNode("mainWebView")
    m.loadingLabel = m.top.findNode("loadingLabel")
    
    ' Observa o status de carregamento
    m.webView.observeField("loadStatus", "onLoadStatusChange")
    
    ' Configura o link
    m.webView.url = "https://smart-stream-visions.lovable.app"
    
    ' Ajusta o tamanho para a tela real
    deviceInfo = CreateObject("roDeviceInfo")
    displaySize = deviceInfo.GetDisplaySize()
    m.webView.width = displaySize.w
    m.webView.height = displaySize.h
    
    ' Inicia o carregamento
    m.webView.control = "load"
    m.webView.setFocus(true)
end sub

sub onLoadStatusChange()
    print "Status do WebView: " + m.webView.loadStatus
    if m.webView.loadStatus = "ready"
        m.webView.visible = true
        m.loadingLabel.visible = false
        m.webView.setFocus(true)
    end if
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
