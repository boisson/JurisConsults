/*
 Copyright (c) 2003-2013, CKSource - Frederico Knabben. All rights reserved.
 For licensing, see LICENSE.md or http://ckeditor.com/license
*/
!function(){function e(e,t,r){var l=o[this.id];if(l)for(var s=this instanceof CKEDITOR.ui.dialog.checkbox,d=0;d<l.length;d++){var c=l[d];switch(c.type){case i:if(!e)continue;if(null!==e.getAttribute(c.name))return e=e.getAttribute(c.name),s?this.setValue("true"==e.toLowerCase()):this.setValue(e),void 0;s&&this.setValue(!!c["default"]);break;case a:if(!e)continue;if(c.name in r)return e=r[c.name],s?this.setValue("true"==e.toLowerCase()):this.setValue(e),void 0;s&&this.setValue(!!c["default"]);break;case n:if(!t)continue;if(t.getAttribute(c.name))return e=t.getAttribute(c.name),s?this.setValue("true"==e.toLowerCase()):this.setValue(e),void 0;s&&this.setValue(!!c["default"])}}}function t(e,t,r){var l=o[this.id];if(l)for(var s=""===this.getValue(),d=this instanceof CKEDITOR.ui.dialog.checkbox,c=0;c<l.length;c++){var u=l[c];switch(u.type){case i:if(!e||"data"==u.name&&t&&!e.hasAttribute("data"))continue;var p=this.getValue();s||d&&p===u["default"]?e.removeAttribute(u.name):e.setAttribute(u.name,p);break;case a:if(!e)continue;if(p=this.getValue(),s||d&&p===u["default"])u.name in r&&r[u.name].remove();else if(u.name in r)r[u.name].setAttribute("value",p);else{var m=CKEDITOR.dom.element.createFromHtml("<cke:param></cke:param>",e.getDocument());m.setAttributes({name:u.name,value:p}),1>e.getChildCount()?m.appendTo(e):m.insertBefore(e.getFirst())}break;case n:if(!t)continue;p=this.getValue(),s||d&&p===u["default"]?t.removeAttribute(u.name):t.setAttribute(u.name,p)}}}for(var i=1,a=2,n=4,o={id:[{type:i,name:"id"}],classid:[{type:i,name:"classid"}],codebase:[{type:i,name:"codebase"}],pluginspage:[{type:n,name:"pluginspage"}],src:[{type:a,name:"movie"},{type:n,name:"src"},{type:i,name:"data"}],name:[{type:n,name:"name"}],align:[{type:i,name:"align"}],"class":[{type:i,name:"class"},{type:n,name:"class"}],width:[{type:i,name:"width"},{type:n,name:"width"}],height:[{type:i,name:"height"},{type:n,name:"height"}],hSpace:[{type:i,name:"hSpace"},{type:n,name:"hSpace"}],vSpace:[{type:i,name:"vSpace"},{type:n,name:"vSpace"}],style:[{type:i,name:"style"},{type:n,name:"style"}],type:[{type:n,name:"type"}]},r="play loop menu quality scale salign wmode bgcolor base flashvars allowScriptAccess allowFullScreen".split(" "),l=0;l<r.length;l++)o[r[l]]=[{type:n,name:r[l]},{type:a,name:r[l]}];for(r=["allowFullScreen","play","loop","menu"],l=0;l<r.length;l++)o[r[l]][0]["default"]=o[r[l]][1]["default"]=!0;CKEDITOR.dialog.add("flash",function(i){var a,n=!i.config.flashEmbedTagOnly,o=i.config.flashAddEmbedTag||i.config.flashEmbedTagOnly,r="<div>"+CKEDITOR.tools.htmlEncode(i.lang.common.preview)+'<br><div id="cke_FlashPreviewLoader'+CKEDITOR.tools.getNextNumber()+'" style="display:none"><div class="loading">&nbsp;</div></div><div id="cke_FlashPreviewBox'+CKEDITOR.tools.getNextNumber()+'" class="FlashPreviewBox"></div></div>';return{title:i.lang.flash.title,minWidth:420,minHeight:310,onShow:function(){this.fakeImage=this.objectNode=this.embedNode=null,a=new CKEDITOR.dom.element("embed",i.document);var e=this.getSelectedElement();if(e&&e.data("cke-real-element-type")&&"flash"==e.data("cke-real-element-type")){this.fakeImage=e;var t=i.restoreRealElement(e),n=null,o=null,r={};if("cke:object"==t.getName()){n=t,t=n.getElementsByTag("embed","cke"),0<t.count()&&(o=t.getItem(0));for(var t=n.getElementsByTag("param","cke"),l=0,s=t.count();s>l;l++){var d=t.getItem(l),c=d.getAttribute("name"),d=d.getAttribute("value");r[c]=d}}else"cke:embed"==t.getName()&&(o=t);this.objectNode=n,this.embedNode=o,this.setupContent(n,o,r,e)}},onOk:function(){var e=null,t=null,a=null;if(this.fakeImage?(e=this.objectNode,t=this.embedNode):(n&&(e=CKEDITOR.dom.element.createFromHtml("<cke:object></cke:object>",i.document),e.setAttributes({classid:"clsid:d27cdb6e-ae6d-11cf-96b8-444553540000",codebase:"http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=6,0,40,0"})),o&&(t=CKEDITOR.dom.element.createFromHtml("<cke:embed></cke:embed>",i.document),t.setAttributes({type:"application/x-shockwave-flash",pluginspage:"http://www.macromedia.com/go/getflashplayer"}),e&&t.appendTo(e))),e)for(var a={},r=e.getElementsByTag("param","cke"),l=0,s=r.count();s>l;l++)a[r.getItem(l).getAttribute("name")]=r.getItem(l);r={},l={},this.commitContent(e,t,a,r,l),e=i.createFakeElement(e||t,"cke_flash","flash",!0),e.setAttributes(l),e.setStyles(r),this.fakeImage?(e.replace(this.fakeImage),i.getSelection().selectElement(e)):i.insertElement(e)},onHide:function(){this.preview&&this.preview.setHtml("")},contents:[{id:"info",label:i.lang.common.generalTab,accessKey:"I",elements:[{type:"vbox",padding:0,children:[{type:"hbox",widths:["280px","110px"],align:"right",children:[{id:"src",type:"text",label:i.lang.common.url,required:!0,validate:CKEDITOR.dialog.validate.notEmpty(i.lang.flash.validateSrc),setup:e,commit:t,onLoad:function(){var e=this.getDialog(),t=function(t){a.setAttribute("src",t),e.preview.setHtml('<embed height="100%" width="100%" src="'+CKEDITOR.tools.htmlEncode(a.getAttribute("src"))+'" type="application/x-shockwave-flash"></embed>')};e.preview=e.getContentElement("info","preview").getElement().getChild(3),this.on("change",function(e){e.data&&e.data.value&&t(e.data.value)}),this.getInputElement().on("change",function(){t(this.getValue())},this)}},{type:"button",id:"browse",filebrowser:"info:src",hidden:!0,style:"display:inline-block;margin-top:10px;",label:i.lang.common.browseServer}]}]},{type:"hbox",widths:["25%","25%","25%","25%","25%"],children:[{type:"text",id:"width",requiredContent:"embed[width]",style:"width:95px",label:i.lang.common.width,validate:CKEDITOR.dialog.validate.htmlLength(i.lang.common.invalidHtmlLength.replace("%1",i.lang.common.width)),setup:e,commit:t},{type:"text",id:"height",requiredContent:"embed[height]",style:"width:95px",label:i.lang.common.height,validate:CKEDITOR.dialog.validate.htmlLength(i.lang.common.invalidHtmlLength.replace("%1",i.lang.common.height)),setup:e,commit:t},{type:"text",id:"hSpace",requiredContent:"embed[hspace]",style:"width:95px",label:i.lang.flash.hSpace,validate:CKEDITOR.dialog.validate.integer(i.lang.flash.validateHSpace),setup:e,commit:t},{type:"text",id:"vSpace",requiredContent:"embed[vspace]",style:"width:95px",label:i.lang.flash.vSpace,validate:CKEDITOR.dialog.validate.integer(i.lang.flash.validateVSpace),setup:e,commit:t}]},{type:"vbox",children:[{type:"html",id:"preview",style:"width:95%;",html:r}]}]},{id:"Upload",hidden:!0,filebrowser:"uploadButton",label:i.lang.common.upload,elements:[{type:"file",id:"upload",label:i.lang.common.upload,size:38},{type:"fileButton",id:"uploadButton",label:i.lang.common.uploadSubmit,filebrowser:"info:src","for":["Upload","upload"]}]},{id:"properties",label:i.lang.flash.propertiesTab,elements:[{type:"hbox",widths:["50%","50%"],children:[{id:"scale",type:"select",requiredContent:"embed[scale]",label:i.lang.flash.scale,"default":"",style:"width : 100%;",items:[[i.lang.common.notSet,""],[i.lang.flash.scaleAll,"showall"],[i.lang.flash.scaleNoBorder,"noborder"],[i.lang.flash.scaleFit,"exactfit"]],setup:e,commit:t},{id:"allowScriptAccess",type:"select",requiredContent:"embed[allowscriptaccess]",label:i.lang.flash.access,"default":"",style:"width : 100%;",items:[[i.lang.common.notSet,""],[i.lang.flash.accessAlways,"always"],[i.lang.flash.accessSameDomain,"samedomain"],[i.lang.flash.accessNever,"never"]],setup:e,commit:t}]},{type:"hbox",widths:["50%","50%"],children:[{id:"wmode",type:"select",requiredContent:"embed[wmode]",label:i.lang.flash.windowMode,"default":"",style:"width : 100%;",items:[[i.lang.common.notSet,""],[i.lang.flash.windowModeWindow,"window"],[i.lang.flash.windowModeOpaque,"opaque"],[i.lang.flash.windowModeTransparent,"transparent"]],setup:e,commit:t},{id:"quality",type:"select",requiredContent:"embed[quality]",label:i.lang.flash.quality,"default":"high",style:"width : 100%;",items:[[i.lang.common.notSet,""],[i.lang.flash.qualityBest,"best"],[i.lang.flash.qualityHigh,"high"],[i.lang.flash.qualityAutoHigh,"autohigh"],[i.lang.flash.qualityMedium,"medium"],[i.lang.flash.qualityAutoLow,"autolow"],[i.lang.flash.qualityLow,"low"]],setup:e,commit:t}]},{type:"hbox",widths:["50%","50%"],children:[{id:"align",type:"select",requiredContent:"object[align]",label:i.lang.common.align,"default":"",style:"width : 100%;",items:[[i.lang.common.notSet,""],[i.lang.common.alignLeft,"left"],[i.lang.flash.alignAbsBottom,"absBottom"],[i.lang.flash.alignAbsMiddle,"absMiddle"],[i.lang.flash.alignBaseline,"baseline"],[i.lang.common.alignBottom,"bottom"],[i.lang.common.alignMiddle,"middle"],[i.lang.common.alignRight,"right"],[i.lang.flash.alignTextTop,"textTop"],[i.lang.common.alignTop,"top"]],setup:e,commit:function(e,i,a,n,o){var r=this.getValue();t.apply(this,arguments),r&&(o.align=r)}},{type:"html",html:"<div></div>"}]},{type:"fieldset",label:CKEDITOR.tools.htmlEncode(i.lang.flash.flashvars),children:[{type:"vbox",padding:0,children:[{type:"checkbox",id:"menu",label:i.lang.flash.chkMenu,"default":!0,setup:e,commit:t},{type:"checkbox",id:"play",label:i.lang.flash.chkPlay,"default":!0,setup:e,commit:t},{type:"checkbox",id:"loop",label:i.lang.flash.chkLoop,"default":!0,setup:e,commit:t},{type:"checkbox",id:"allowFullScreen",label:i.lang.flash.chkFull,"default":!0,setup:e,commit:t}]}]}]},{id:"advanced",label:i.lang.common.advancedTab,elements:[{type:"hbox",children:[{type:"text",id:"id",requiredContent:"object[id]",label:i.lang.common.id,setup:e,commit:t}]},{type:"hbox",widths:["45%","55%"],children:[{type:"text",id:"bgcolor",requiredContent:"embed[bgcolor]",label:i.lang.flash.bgcolor,setup:e,commit:t},{type:"text",id:"class",requiredContent:"embed(cke-xyz)",label:i.lang.common.cssClass,setup:e,commit:t}]},{type:"text",id:"style",requiredContent:"embed{cke-xyz}",validate:CKEDITOR.dialog.validate.inlineStyle(i.lang.common.invalidInlineStyle),label:i.lang.common.cssStyle,setup:e,commit:t}]}]}})}();