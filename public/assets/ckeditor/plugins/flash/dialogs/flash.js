/*
 Copyright (c) 2003-2013, CKSource - Frederico Knabben. All rights reserved.
 For licensing, see LICENSE.html or http://ckeditor.com/license
*/
(function(){function a(a,b,g){var h=f[this.id];if(h)for(var j=this instanceof CKEDITOR.ui.dialog.checkbox,k=0;k<h.length;k++){var l=h[k];switch(l.type){case c:if(!a)continue;if(null!==a.getAttribute(l.name)){a=a.getAttribute(l.name),j?this.setValue("true"==a.toLowerCase()):this.setValue(a);return}j&&this.setValue(!!l["default"]);break;case d:if(!a)continue;if(l.name in g){a=g[l.name],j?this.setValue("true"==a.toLowerCase()):this.setValue(a);return}j&&this.setValue(!!l["default"]);break;case e:if(!b)continue;if(b.getAttribute(l.name)){a=b.getAttribute(l.name),j?this.setValue("true"==a.toLowerCase()):this.setValue(a);return}j&&this.setValue(!!l["default"])}}}function b(a,b,g){var h=f[this.id];if(h)for(var j=""===this.getValue(),k=this instanceof CKEDITOR.ui.dialog.checkbox,l=0;l<h.length;l++){var m=h[l];switch(m.type){case c:if(!a||"data"==m.name&&b&&!a.hasAttribute("data"))continue;var p=this.getValue();j||k&&p===m["default"]?a.removeAttribute(m.name):a.setAttribute(m.name,p);break;case d:if(!a)continue;p=this.getValue();if(j||k&&p===m["default"])m.name in g&&g[m.name].remove();else if(m.name in g)g[m.name].setAttribute("value",p);else{var q=CKEDITOR.dom.element.createFromHtml("<cke:param></cke:param>",a.getDocument());q.setAttributes({name:m.name,value:p}),1>a.getChildCount()?q.appendTo(a):q.insertBefore(a.getFirst())}break;case e:if(!b)continue;p=this.getValue(),j||k&&p===m["default"]?b.removeAttribute(m.name):b.setAttribute(m.name,p)}}}for(var c=1,d=2,e=4,f={id:[{type:c,name:"id"}],classid:[{type:c,name:"classid"}],codebase:[{type:c,name:"codebase"}],pluginspage:[{type:e,name:"pluginspage"}],src:[{type:d,name:"movie"},{type:e,name:"src"},{type:c,name:"data"}],name:[{type:e,name:"name"}],align:[{type:c,name:"align"}],"class":[{type:c,name:"class"},{type:e,name:"class"}],width:[{type:c,name:"width"},{type:e,name:"width"}],height:[{type:c,name:"height"},{type:e,name:"height"}],hSpace:[{type:c,name:"hSpace"},{type:e,name:"hSpace"}],vSpace:[{type:c,name:"vSpace"},{type:e,name:"vSpace"}],style:[{type:c,name:"style"},{type:e,name:"style"}],type:[{type:e,name:"type"}]},g="play loop menu quality scale salign wmode bgcolor base flashvars allowScriptAccess allowFullScreen".split(" "),h=0;h<g.length;h++)f[g[h]]=[{type:e,name:g[h]},{type:d,name:g[h]}];g=["allowFullScreen","play","loop","menu"];for(h=0;h<g.length;h++)f[g[h]][0]["default"]=f[g[h]][1]["default"]=!0;CKEDITOR.dialog.add("flash",function(c){var d=!c.config.flashEmbedTagOnly,e=c.config.flashAddEmbedTag||c.config.flashEmbedTagOnly,f,g="<div>"+CKEDITOR.tools.htmlEncode(c.lang.common.preview)+'<br><div id="cke_FlashPreviewLoader'+CKEDITOR.tools.getNextNumber()+'" style="display:none"><div class="loading">&nbsp;</div></div><div id="cke_FlashPreviewBox'+CKEDITOR.tools.getNextNumber()+'" class="FlashPreviewBox"></div></div>';return{title:c.lang.flash.title,minWidth:420,minHeight:310,onShow:function(){this.fakeImage=this.objectNode=this.embedNode=null,f=new CKEDITOR.dom.element("embed",c.document);var a=this.getSelectedElement();if(a&&a.data("cke-real-element-type")&&"flash"==a.data("cke-real-element-type")){this.fakeImage=a;var b=c.restoreRealElement(a),d=null,e=null,g={};if("cke:object"==b.getName()){d=b,b=d.getElementsByTag("embed","cke"),0<b.count()&&(e=b.getItem(0));for(var b=d.getElementsByTag("param","cke"),h=0,i=b.count();h<i;h++){var j=b.getItem(h),l=j.getAttribute("name"),j=j.getAttribute("value");g[l]=j}}else"cke:embed"==b.getName()&&(e=b);this.objectNode=d,this.embedNode=e,this.setupContent(d,e,g,a)}},onOk:function(){var a=null,b=null,f=null;if(this.fakeImage)a=this.objectNode,b=this.embedNode;else if(d&&(a=CKEDITOR.dom.element.createFromHtml("<cke:object></cke:object>",c.document),a.setAttributes({classid:"clsid:d27cdb6e-ae6d-11cf-96b8-444553540000",codebase:"http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=6,0,40,0"})),e)b=CKEDITOR.dom.element.createFromHtml("<cke:embed></cke:embed>",c.document),b.setAttributes({type:"application/x-shockwave-flash",pluginspage:"http://www.macromedia.com/go/getflashplayer"}),a&&b.appendTo(a);if(a)for(var f={},g=a.getElementsByTag("param","cke"),h=0,j=g.count();h<j;h++)f[g.getItem(h).getAttribute("name")]=g.getItem(h);g={},h={},this.commitContent(a,b,f,g,h),a=c.createFakeElement(a||b,"cke_flash","flash",!0),a.setAttributes(h),a.setStyles(g),this.fakeImage?(a.replace(this.fakeImage),c.getSelection().selectElement(a)):c.insertElement(a)},onHide:function(){this.preview&&this.preview.setHtml("")},contents:[{id:"info",label:c.lang.common.generalTab,accessKey:"I",elements:[{type:"vbox",padding:0,children:[{type:"hbox",widths:["280px","110px"],align:"right",children:[{id:"src",type:"text",label:c.lang.common.url,required:!0,validate:CKEDITOR.dialog.validate.notEmpty(c.lang.flash.validateSrc),setup:a,commit:b,onLoad:function(){var a=this.getDialog(),b=function(b){f.setAttribute("src",b),a.preview.setHtml('<embed height="100%" width="100%" src="'+CKEDITOR.tools.htmlEncode(f.getAttribute("src"))+'" type="application/x-shockwave-flash"></embed>')};a.preview=a.getContentElement("info","preview").getElement().getChild(3),this.on("change",function(a){a.data&&a.data.value&&b(a.data.value)}),this.getInputElement().on("change",function(){b(this.getValue())},this)}},{type:"button",id:"browse",filebrowser:"info:src",hidden:!0,style:"display:inline-block;margin-top:10px;",label:c.lang.common.browseServer}]}]},{type:"hbox",widths:["25%","25%","25%","25%","25%"],children:[{type:"text",id:"width",requiredContent:"embed[width]",style:"width:95px",label:c.lang.common.width,validate:CKEDITOR.dialog.validate.htmlLength(c.lang.common.invalidHtmlLength.replace("%1",c.lang.common.width)),setup:a,commit:b},{type:"text",id:"height",requiredContent:"embed[height]",style:"width:95px",label:c.lang.common.height,validate:CKEDITOR.dialog.validate.htmlLength(c.lang.common.invalidHtmlLength.replace("%1",c.lang.common.height)),setup:a,commit:b},{type:"text",id:"hSpace",requiredContent:"embed[hspace]",style:"width:95px",label:c.lang.flash.hSpace,validate:CKEDITOR.dialog.validate.integer(c.lang.flash.validateHSpace),setup:a,commit:b},{type:"text",id:"vSpace",requiredContent:"embed[vspace]",style:"width:95px",label:c.lang.flash.vSpace,validate:CKEDITOR.dialog.validate.integer(c.lang.flash.validateVSpace),setup:a,commit:b}]},{type:"vbox",children:[{type:"html",id:"preview",style:"width:95%;",html:g}]}]},{id:"Upload",hidden:!0,filebrowser:"uploadButton",label:c.lang.common.upload,elements:[{type:"file",id:"upload",label:c.lang.common.upload,size:38},{type:"fileButton",id:"uploadButton",label:c.lang.common.uploadSubmit,filebrowser:"info:src","for":["Upload","upload"]}]},{id:"properties",label:c.lang.flash.propertiesTab,elements:[{type:"hbox",widths:["50%","50%"],children:[{id:"scale",type:"select",requiredContent:"embed[scale]",label:c.lang.flash.scale,"default":"",style:"width : 100%;",items:[[c.lang.common.notSet,""],[c.lang.flash.scaleAll,"showall"],[c.lang.flash.scaleNoBorder,"noborder"],[c.lang.flash.scaleFit,"exactfit"]],setup:a,commit:b},{id:"allowScriptAccess",type:"select",requiredContent:"embed[allowscriptaccess]",label:c.lang.flash.access,"default":"",style:"width : 100%;",items:[[c.lang.common.notSet,""],[c.lang.flash.accessAlways,"always"],[c.lang.flash.accessSameDomain,"samedomain"],[c.lang.flash.accessNever,"never"]],setup:a,commit:b}]},{type:"hbox",widths:["50%","50%"],children:[{id:"wmode",type:"select",requiredContent:"embed[wmode]",label:c.lang.flash.windowMode,"default":"",style:"width : 100%;",items:[[c.lang.common.notSet,""],[c.lang.flash.windowModeWindow,"window"],[c.lang.flash.windowModeOpaque,"opaque"],[c.lang.flash.windowModeTransparent,"transparent"]],setup:a,commit:b},{id:"quality",type:"select",requiredContent:"embed[quality]",label:c.lang.flash.quality,"default":"high",style:"width : 100%;",items:[[c.lang.common.notSet,""],[c.lang.flash.qualityBest,"best"],[c.lang.flash.qualityHigh,"high"],[c.lang.flash.qualityAutoHigh,"autohigh"],[c.lang.flash.qualityMedium,"medium"],[c.lang.flash.qualityAutoLow,"autolow"],[c.lang.flash.qualityLow,"low"]],setup:a,commit:b}]},{type:"hbox",widths:["50%","50%"],children:[{id:"align",type:"select",requiredContent:"object[align]",label:c.lang.common.align,"default":"",style:"width : 100%;",items:[[c.lang.common.notSet,""],[c.lang.common.alignLeft,"left"],[c.lang.flash.alignAbsBottom,"absBottom"],[c.lang.flash.alignAbsMiddle,"absMiddle"],[c.lang.flash.alignBaseline,"baseline"],[c.lang.common.alignBottom,"bottom"],[c.lang.common.alignMiddle,"middle"],[c.lang.common.alignRight,"right"],[c.lang.flash.alignTextTop,"textTop"],[c.lang.common.alignTop,"top"]],setup:a,commit:function(a,c,d,e,f){var g=this.getValue();b.apply(this,arguments),g&&(f.align=g)}},{type:"html",html:"<div></div>"}]},{type:"fieldset",label:CKEDITOR.tools.htmlEncode(c.lang.flash.flashvars),children:[{type:"vbox",padding:0,children:[{type:"checkbox",id:"menu",label:c.lang.flash.chkMenu,"default":!0,setup:a,commit:b},{type:"checkbox",id:"play",label:c.lang.flash.chkPlay,"default":!0,setup:a,commit:b},{type:"checkbox",id:"loop",label:c.lang.flash.chkLoop,"default":!0,setup:a,commit:b},{type:"checkbox",id:"allowFullScreen",label:c.lang.flash.chkFull,"default":!0,setup:a,commit:b}]}]}]},{id:"advanced",label:c.lang.common.advancedTab,elements:[{type:"hbox",children:[{type:"text",id:"id",requiredContent:"object[id]",label:c.lang.common.id,setup:a,commit:b}]},{type:"hbox",widths:["45%","55%"],children:[{type:"text",id:"bgcolor",requiredContent:"embed[bgcolor]",label:c.lang.flash.bgcolor,setup:a,commit:b},{type:"text",id:"class",requiredContent:"embed(cke-xyz)",label:c.lang.common.cssClass,setup:a,commit:b}]},{type:"text",id:"style",requiredContent:"embed{cke-xyz}",validate:CKEDITOR.dialog.validate.inlineStyle(c.lang.common.invalidInlineStyle),label:c.lang.common.cssStyle,setup:a,commit:b}]}]}})})();