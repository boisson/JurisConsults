/*
Copyright (c) 2003-2011, CKSource - Frederico Knabben. All rights reserved.
For licensing, see LICENSE.html or http://ckeditor.com/license
*/
CKEDITOR.editorConfig=function(t){t.filebrowserBrowseUrl="/ckeditor/attachment_files",t.filebrowserFlashBrowseUrl="/ckeditor/attachment_files",t.filebrowserFlashUploadUrl="/ckeditor/attachment_files",t.filebrowserImageBrowseLinkUrl="/ckeditor/pictures",t.filebrowserImageBrowseUrl="/ckeditor/pictures",t.filebrowserImageUploadUrl="/ckeditor/pictures",t.filebrowserUploadUrl="/ckeditor/attachment_files",t.filebrowserParams=function(){for(var t,e,i,n=document.getElementsByTagName("meta"),s=new Object,o=0;o<n.length;o++)switch(i=n[o],i.name){case"csrf-token":t=i.content;break;case"csrf-param":e=i.content;break;default:continue}return void 0!==e&&void 0!==t&&(s[e]=t),s},t.addQueryString=function(t,e){var i=[];if(!e)return t;for(var n in e)i.push(n+"="+encodeURIComponent(e[n]));return t+(-1!=t.indexOf("?")?"&":"?")+i.join("&")},CKEDITOR.on("dialogDefinition",function(e){var i,n,s=e.data.name,o=e.data.definition;CKEDITOR.tools.indexOf(["link","image","attachment","flash"],s)>-1&&(i=o.getContents("Upload")||o.getContents("upload"),n=null==i?null:i.get("upload"),n&&n.filebrowser&&void 0===n.filebrowser.params&&(n.filebrowser.params=t.filebrowserParams(),n.action=t.addQueryString(n.action,n.filebrowser.params)))})};