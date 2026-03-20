sub init()
    m.webView = m.top.findNode("mainWebView")
    m.webView.url = "https://smart-stream-visions.lovable.app"
    m.webView.setFocus(true)
    
    ' Ajusta o tamanho baseado na resolucao da TV
    deviceInfo = CreateObject("roDeviceInfo")
    displaySize = deviceInfo.GetDisplaySize()
    m.webView.width = displaySize.w
    m.webView.height = displaySize.h
end sub

function onKeyEvent(key as String, press as Boolean) as Boolean
    if press
        if key = "back"
            ' Se o webview puder voltar, volta. Senao, fecha o app.
            if m.webView.canGoBack
                m.webView.back = true
                return true
            end if
        end if
    end if
    return false
end function
