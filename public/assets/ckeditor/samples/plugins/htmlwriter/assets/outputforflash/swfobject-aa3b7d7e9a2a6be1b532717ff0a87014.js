var swfobject=function(){function e(){if(!N){try{var e=w.getElementsByTagName("body")[0].appendChild(w.createElement("span"));e.parentNode.removeChild(e)}catch(t){return}N=!0;for(var e=L.length,a=0;e>a;a++)L[a]()}}function t(e){N?e():L[L.length]=e}function a(e){if(typeof S.addEventListener!=I)S.addEventListener("load",e,!1);else if(typeof w.addEventListener!=I)w.addEventListener("load",e,!1);else if(typeof S.attachEvent!=I)p(S,"onload",e);else if("function"==typeof S.onload){var t=S.onload;S.onload=function(){t(),e()}}else S.onload=e}function i(){var e=w.getElementsByTagName("body")[0],t=w.createElement(D);t.setAttribute("type",R);var a=e.appendChild(t);if(a){var i=0;!function(){if(typeof a.GetVariable!=I){var o=a.GetVariable("$version");o&&(o=o.split(" ")[1].split(","),z.pv=[parseInt(o[0],10),parseInt(o[1],10),parseInt(o[2],10)])}else if(10>i)return i++,setTimeout(arguments.callee,10),void 0;e.removeChild(t),a=null,n()}()}else n()}function n(){var e=x.length;if(e>0)for(var t=0;e>t;t++){var a=x[t].id,i=x[t].callbackFn,n={success:!1,id:a};if(0<z.pv[0]){var d=m(a);if(d)if(!h(x[t].swfVersion)||z.wk&&312>z.wk)if(x[t].expressInstall&&r()){n={},n.data=x[t].expressInstall,n.width=d.getAttribute("width")||"0",n.height=d.getAttribute("height")||"0",d.getAttribute("class")&&(n.styleclass=d.getAttribute("class")),d.getAttribute("align")&&(n.align=d.getAttribute("align"));for(var c={},d=d.getElementsByTagName("param"),u=d.length,p=0;u>p;p++)"movie"!=d[p].getAttribute("name").toLowerCase()&&(c[d[p].getAttribute("name")]=d[p].getAttribute("value"));l(n,c,a,i)}else s(d),i&&i(n);else f(a,!0),i&&(n.success=!0,n.ref=o(a),i(n))}else f(a,!0),i&&((a=o(a))&&typeof a.SetVariable!=I&&(n.success=!0,n.ref=a),i(n))}}function o(e){var t=null;return(e=m(e))&&"OBJECT"==e.nodeName&&(typeof e.SetVariable!=I?t=e:(e=e.getElementsByTagName(D)[0])&&(t=e)),t}function r(){return!P&&h("6.0.65")&&(z.win||z.mac)&&!(z.wk&&312>z.wk)}function l(e,t,a,i){P=!0,y=i||null,k={success:!1,id:a};var n=m(a);n&&("OBJECT"==n.nodeName?(v=d(n),T=null):(v=n,T=a),e.id=O,(typeof e.width==I||!/%$/.test(e.width)&&310>parseInt(e.width,10))&&(e.width="310"),(typeof e.height==I||!/%$/.test(e.height)&&137>parseInt(e.height,10))&&(e.height="137"),w.title=w.title.slice(0,47)+" - Flash Player Installation",i=z.ie&&z.win?"ActiveX":"PlugIn",i="MMredirectURL="+S.location.toString().replace(/&/g,"%26")+"&MMplayerType="+i+"&MMdoctitle="+w.title,t.flashvars=typeof t.flashvars!=I?t.flashvars+("&"+i):i,z.ie&&z.win&&4!=n.readyState&&(i=w.createElement("div"),a+="SWFObjectNew",i.setAttribute("id",a),n.parentNode.insertBefore(i,n),n.style.display="none",function(){4==n.readyState?n.parentNode.removeChild(n):setTimeout(arguments.callee,10)}()),c(e,t,a))}function s(e){if(z.ie&&z.win&&4!=e.readyState){var t=w.createElement("div");e.parentNode.insertBefore(t,e),t.parentNode.replaceChild(d(e),t),e.style.display="none",function(){4==e.readyState?e.parentNode.removeChild(e):setTimeout(arguments.callee,10)}()}else e.parentNode.replaceChild(d(e),e)}function d(e){var t=w.createElement("div");if(z.win&&z.ie)t.innerHTML=e.innerHTML;else if((e=e.getElementsByTagName(D)[0])&&(e=e.childNodes))for(var a=e.length,i=0;a>i;i++)!(1==e[i].nodeType&&"PARAM"==e[i].nodeName)&&8!=e[i].nodeType&&t.appendChild(e[i].cloneNode(!0));return t}function c(e,t,a){var i,n=m(a);if(z.wk&&312>z.wk)return i;if(n)if(typeof e.id==I&&(e.id=a),z.ie&&z.win){var o,r="";for(o in e)e[o]!=Object.prototype[o]&&("data"==o.toLowerCase()?t.movie=e[o]:"styleclass"==o.toLowerCase()?r+=' class="'+e[o]+'"':"classid"!=o.toLowerCase()&&(r+=" "+o+'="'+e[o]+'"'));o="";for(var l in t)t[l]!=Object.prototype[l]&&(o+='<param name="'+l+'" value="'+t[l]+'" />');n.outerHTML='<object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000"'+r+">"+o+"</object>",K[K.length]=e.id,i=m(e.id)}else{l=w.createElement(D),l.setAttribute("type",R);for(var s in e)e[s]!=Object.prototype[s]&&("styleclass"==s.toLowerCase()?l.setAttribute("class",e[s]):"classid"!=s.toLowerCase()&&l.setAttribute(s,e[s]));for(r in t)t[r]!=Object.prototype[r]&&"movie"!=r.toLowerCase()&&(e=l,o=r,s=t[r],a=w.createElement("param"),a.setAttribute("name",o),a.setAttribute("value",s),e.appendChild(a));n.parentNode.replaceChild(l,n),i=l}return i}function u(e){var t=m(e);t&&"OBJECT"==t.nodeName&&(z.ie&&z.win?(t.style.display="none",function(){if(4==t.readyState){var a=m(e);if(a){for(var i in a)"function"==typeof a[i]&&(a[i]=null);a.parentNode.removeChild(a)}}else setTimeout(arguments.callee,10)}()):t.parentNode.removeChild(t))}function m(e){var t=null;try{t=w.getElementById(e)}catch(a){}return t}function p(e,t,a){e.attachEvent(t,a),F[F.length]=[e,t,a]}function h(e){var t=z.pv,e=e.split(".");return e[0]=parseInt(e[0],10),e[1]=parseInt(e[1],10)||0,e[2]=parseInt(e[2],10)||0,t[0]>e[0]||t[0]==e[0]&&t[1]>e[1]||t[0]==e[0]&&t[1]==e[1]&&t[2]>=e[2]?!0:!1}function g(e,t,a,i){if(!z.ie||!z.mac){var n=w.getElementsByTagName("head")[0];n&&(a=a&&"string"==typeof a?a:"screen",i&&(C=E=null),E&&C==a||(i=w.createElement("style"),i.setAttribute("type","text/css"),i.setAttribute("media",a),E=n.appendChild(i),z.ie&&z.win&&typeof w.styleSheets!=I&&0<w.styleSheets.length&&(E=w.styleSheets[w.styleSheets.length-1]),C=a),z.ie&&z.win?E&&typeof E.addRule==D&&E.addRule(e,t):E&&typeof w.createTextNode!=I&&E.appendChild(w.createTextNode(e+" {"+t+"}")))}}function f(e,t){if(B){var a=t?"visible":"hidden";N&&m(e)?m(e).style.visibility=a:g("#"+e,"visibility:"+a)}}function b(e){return null!=/[\\\"<>\.;]/.exec(e)&&typeof encodeURIComponent!=I?encodeURIComponent(e):e}var v,T,y,k,E,C,I="undefined",D="object",R="application/x-shockwave-flash",O="SWFObjectExprInst",S=window,w=document,A=navigator,_=!1,L=[function(){_?i():n()}],x=[],K=[],F=[],N=!1,P=!1,B=!0,z=function(){var e=typeof w.getElementById!=I&&typeof w.getElementsByTagName!=I&&typeof w.createElement!=I,t=A.userAgent.toLowerCase(),a=A.platform.toLowerCase(),i=a?/win/.test(a):/win/.test(t),a=a?/mac/.test(a):/mac/.test(t),t=/webkit/.test(t)?parseFloat(t.replace(/^.*webkit\/(\d+(\.\d+)?).*$/,"$1")):!1,n=!1,o=[0,0,0],r=null;if(typeof A.plugins!=I&&typeof A.plugins["Shockwave Flash"]==D)!(r=A.plugins["Shockwave Flash"].description)||typeof A.mimeTypes!=I&&A.mimeTypes[R]&&!A.mimeTypes[R].enabledPlugin||(_=!0,n=!1,r=r.replace(/^.*\s+(\S+\s+\S+$)/,"$1"),o[0]=parseInt(r.replace(/^(.*)\..*$/,"$1"),10),o[1]=parseInt(r.replace(/^.*\.(.*)\s.*$/,"$1"),10),o[2]=/[a-zA-Z]/.test(r)?parseInt(r.replace(/^.*[a-zA-Z]+(.*)$/,"$1"),10):0);else if(typeof S.ActiveXObject!=I)try{var l=new ActiveXObject("ShockwaveFlash.ShockwaveFlash");l&&(r=l.GetVariable("$version"))&&(n=!0,r=r.split(" ")[1].split(","),o=[parseInt(r[0],10),parseInt(r[1],10),parseInt(r[2],10)])}catch(s){}return{w3:e,pv:o,wk:t,ie:n,win:i,mac:a}}();return function(){z.w3&&((typeof w.readyState!=I&&"complete"==w.readyState||typeof w.readyState==I&&(w.getElementsByTagName("body")[0]||w.body))&&e(),N||(typeof w.addEventListener!=I&&w.addEventListener("DOMContentLoaded",e,!1),z.ie&&z.win&&(w.attachEvent("onreadystatechange",function(){"complete"==w.readyState&&(w.detachEvent("onreadystatechange",arguments.callee),e())}),S==top&&function(){if(!N){try{w.documentElement.doScroll("left")}catch(t){return setTimeout(arguments.callee,0),void 0}e()}}()),z.wk&&function(){N||(/loaded|complete/.test(w.readyState)?e():setTimeout(arguments.callee,0))}(),a(e)))}(),function(){z.ie&&z.win&&window.attachEvent("onunload",function(){for(var e=F.length,t=0;e>t;t++)F[t][0].detachEvent(F[t][1],F[t][2]);for(e=K.length,t=0;e>t;t++)u(K[t]);for(var a in z)z[a]=null;z=null;for(var i in swfobject)swfobject[i]=null;swfobject=null})}(),{registerObject:function(e,t,a,i){if(z.w3&&e&&t){var n={};n.id=e,n.swfVersion=t,n.expressInstall=a,n.callbackFn=i,x[x.length]=n,f(e,!1)}else i&&i({success:!1,id:e})},getObjectById:function(e){return z.w3?o(e):void 0},embedSWF:function(e,a,i,n,o,s,d,u,m,p){var g={success:!1,id:a};z.w3&&!(z.wk&&312>z.wk)&&e&&a&&i&&n&&o?(f(a,!1),t(function(){i+="",n+="";var t={};if(m&&typeof m===D)for(var b in m)t[b]=m[b];if(t.data=e,t.width=i,t.height=n,b={},u&&typeof u===D)for(var v in u)b[v]=u[v];if(d&&typeof d===D)for(var T in d)b.flashvars=typeof b.flashvars!=I?b.flashvars+("&"+T+"="+d[T]):T+"="+d[T];if(h(o))v=c(t,b,a),t.id==a&&f(a,!0),g.success=!0,g.ref=v;else{if(s&&r())return t.data=s,l(t,b,a,p),void 0;f(a,!0)}p&&p(g)})):p&&p(g)},switchOffAutoHideShow:function(){B=!1},ua:z,getFlashPlayerVersion:function(){return{major:z.pv[0],minor:z.pv[1],release:z.pv[2]}},hasFlashPlayerVersion:h,createSWF:function(e,t,a){return z.w3?c(e,t,a):void 0},showExpressInstall:function(e,t,a,i){z.w3&&r()&&l(e,t,a,i)},removeSWF:function(e){z.w3&&u(e)},createCSS:function(e,t,a,i){z.w3&&g(e,t,a,i)},addDomLoadEvent:t,addLoadEvent:a,getQueryParamValue:function(e){var t=w.location.search||w.location.hash;if(t){if(/\?/.test(t)&&(t=t.split("?")[1]),null==e)return b(t);for(var t=t.split("&"),a=0;a<t.length;a++)if(t[a].substring(0,t[a].indexOf("="))==e)return b(t[a].substring(t[a].indexOf("=")+1))}return""},expressInstallCallback:function(){if(P){var e=m(O);e&&v&&(e.parentNode.replaceChild(v,e),T&&(f(T,!0),z.ie&&z.win&&(v.style.display="block")),y&&y(k)),P=!1}}}}();