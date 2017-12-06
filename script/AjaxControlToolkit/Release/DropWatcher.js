﻿function callbackSuccessStub(n,t){var i=t.split(":"),u=i[0],r=$find(u);r&&r._onCallbackSuccess(n,i[1])}function callbackErrorStub(n,t){var i=t.split(":"),u=i[0],r=$find(u);alert("error");r&&r._onCallbackError(n,i[1])}Type.registerNamespace("Sys.Extended.UI");Sys.Extended.UI.RepeatDirection=function(){throw Error.invalidOperation();};Sys.Extended.UI.RepeatDirection.prototype={Vertical:0,Horizontal:1};Sys.Extended.UI.RepeatDirection.registerEnum("Sys.Extended.UI.RepeatDirection");Sys.Extended.UI.DragDropList=function(n){Sys.Extended.UI.DragDropList.initializeBase(this,[n]);this._acceptedDataTypes=[];this._isDragging=null;this._dataType=null;this._dragMode=Sys.Extended.UI.DragMode.Move;this._dragVisual=null;this._direction=Sys.Extended.UI.RepeatDirection.Vertical;this._emptyTemplate=null;this._emptyTemplateInstance=null;this._dropCueTemplate=null;this._dropCueTemplateInstance=null;this._floatContainerInstance=null;this._originalParent=null;this._originalNextSibling=null;this._originalZIndex=null;this._currentContext=null;this._data=null};Sys.Extended.UI.DragDropList.IsValidDataType=function(n){return n&&typeof n=="string"&&n.length>=4?n.substring(0,4)==="HTML":!1};Sys.Extended.UI.DragDropList.prototype={get_data:function(){return this._data},set_data:function(n){this._data=n},initialize:function(){Sys.Extended.UI.DragDropList.callBaseMethod(this,"initialize");this.get_element().__dragDropList=this;Sys.Extended.UI.DragDropManager.registerDropTarget(this)},startDragDrop:function(n,t,i){this._isDragging||(this._isDragging=!0,this._currentContext=t,i?this._dragVisual=i:i=this.createDragVisual(n),Sys.Extended.UI.DragDropManager.startDragDrop(this,i,t,!(Sys.Browser.agent==Sys.Browser.InternetExplorer&&Sys.Browser.version>7&&Sys.Browser.documentMode!=0)))},createDragVisual:function(n){var i,u,t,r,f,e;return this._dragVisual=this._dragMode===Sys.Extended.UI.DragMode.Copy?n.cloneNode(!0):n,i=Sys.Extended.UI.DragDropManager._getInstance().getScrollOffset(n,!0),this._dragVisual.preDragWidth=this._dragVisual.style.width,this._dragVisual.preDragHeight=this._dragVisual.style.height,this._dragVisual.style.width=n.offsetWidth+"px",this._dragVisual.style.height=n.offsetHeight+"px",this._dragVisual.style.opacity="0.4",this._dragVisual.style.filter="progid:DXImageTransform.Microsoft.BasicImage(opacity=0.4);",this._originalZIndex=this._dragVisual.style.zIndex,this._dragVisual.style.zIndex=99999,this._originalParent=this._dragVisual.parentNode,this._originalNextSibling=Sys.Extended.UI.DragDropManager._getInstance().getNextSibling(this._dragVisual),u=$common.getLocation(n),t=this._getFloatContainer(),$common.setLocation(t,u),Sys.Extended.UI.DragDropManager._getInstance().hasParent(this._dragVisual)&&this._dragVisual.parentNode.removeChild(this._dragVisual),t.appendChild(this._dragVisual),r=Sys.Extended.UI.DragDropManager._getInstance().getScrollOffset(n,!0),(i.x!==r.x||i.y!==r.y)&&(f=Sys.Extended.UI.DragDropManager._getInstance().subtractPoints(i,r),e=Sys.Extended.UI.DragDropManager._getInstance().subtractPoints(u,f),$common.setLocation(t,e)),t},get_emptyTemplate:function(){return this._emptyTemplate},set_emptyTemplate:function(n){this._emptyTemplate=n},get_dragDataType:function(){return this._dataType},set_dragDataType:function(n){this._dataType=n},getDragData:function(n){return n},get_dragMode:function(){return this._dragMode},set_dragMode:function(n){this._dragMode=n},dispose:function(){Sys.Extended.UI.DragDropManager.unregisterDropTarget(this);this.get_element().__dragDropList=null;Sys.Extended.UI.DragDropList.callBaseMethod(this,"dispose")},onDragStart:function(){this._validate()},onDrag:function(){},onDragEnd:function(n){if(this._floatContainerInstance?(this._dragMode===Sys.Extended.UI.DragMode.Copy?this._floatContainerInstance.removeChild(this._dragVisual):(this._dragVisual.style.opacity="0.999",this._dragVisual.style.filter="",this._dragVisual.style.zIndex=this._originalZIndex?this._originalZIndex:0,this._dragVisual.preDragWidth!=null&&(this._dragVisual.style.width=this._dragVisual.preDragWidth,this._dragVisual.preDragWidth=null),this._dragVisual.preDragHeight!=null&&(this._dragVisual.style.height=this._dragVisual.preDragHeight,this._dragVisual.preDragHeight=null),n?(this._dragVisual.parentNode.removeChild(this._dragVisual),this._originalNextSibling!=null?this._originalParent.insertBefore(this._dragVisual,this._originalNextSibling):this._originalParent.appendChild(this._dragVisual)):this._dragVisual.parentNode===this._floatContainerInstance&&this._dragVisual.parentNode.removeChild(this._dragVisual)),document.body.removeChild(this._floatContainerInstance)):this._dragVisual.parentNode.removeChild(this._dragVisual),!n&&this._data&&this._dragMode===Sys.Extended.UI.DragMode.Move){var t=this.getDragData(this._currentContext);this._data&&t&&Array.remove(this._data,t)}this._isDragging=!1;this._validate()},get_direction:function(){return this._direction},set_direction:function(n){this._direction=n},get_acceptedDataTypes:function(){return this._acceptedDataTypes},set_acceptedDataTypes:function(n){this._acceptedDataTypes=typeof n=="string"?n.split(","):n},get_dropCueTemplate:function(){return this._dropCueTemplate},set_dropCueTemplate:function(n){this._dropCueTemplate=n},get_dropTargetElement:function(){return this.get_element()},canDrop:function(n,t){for(var i=0;i<this._acceptedDataTypes.length;i++)if(this._acceptedDataTypes[i]===t)return!0;return!1},drop:function(n,t,i){if(Sys.Extended.UI.DragDropList.IsValidDataType(t)&&n===Sys.Extended.UI.DragMode.Move){dragVisual=i;var r=this._findPotentialNextSibling(dragVisual);this._setDropCueVisible(!1,dragVisual);dragVisual.parentNode.removeChild(dragVisual);r?this.get_element().insertBefore(dragVisual,r):this.get_element().appendChild(dragVisual)}else this._setDropCueVisible(!1)},onDragEnterTarget:function(n,t,i){Sys.Extended.UI.DragDropList.IsValidDataType(t)&&(this._setDropCueVisible(!0,i),this._validate())},onDragLeaveTarget:function(n,t){Sys.Extended.UI.DragDropList.IsValidDataType(t)&&(this._setDropCueVisible(!1),this._validate())},onDragInTarget:function(n,t,i){Sys.Extended.UI.DragDropList.IsValidDataType(t)&&this._setDropCueVisible(!0,i)},_setDropCueVisible:function(n,t){var r,i;this._dropCueTemplate&&(n?(this._dropCueTemplateInstance||(r=document.createDocumentFragment(),this._dropCueTemplateInstance=this._dropCueTemplate.cloneNode(!0)),i=this._findPotentialNextSibling(t),Sys.Extended.UI.DragDropManager._getInstance().hasParent(this._dropCueTemplateInstance)?Sys.Extended.UI.DragDropManager._getInstance().getNextSibling(this._dropCueTemplateInstance)!==i&&(this.get_element().removeChild(this._dropCueTemplateInstance),i?this.get_element().insertBefore(this._dropCueTemplateInstance,i):this.get_element().appendChild(this._dropCueTemplateInstance)):(i?this.get_element().insertBefore(this._dropCueTemplateInstance,i):this.get_element().appendChild(this._dropCueTemplateInstance),this._dropCueTemplateInstance.style.width=t.offsetWidth+"px",this._dropCueTemplateInstance.style.height=t.offsetHeight+"px")):this._dropCueTemplateInstance&&Sys.Extended.UI.DragDropManager._getInstance().hasParent(this._dropCueTemplateInstance)&&this.get_element().removeChild(this._dropCueTemplateInstance))},_findPotentialNextSibling:function(n){for(var r=$common.getBounds(n),u=this._direction===0,i,t=this.get_element().firstChild;t!==null;t=t.nextSibling)if(t.innerHTML&&t!==this._dropCueTemplateInstance&&t!==this._emptyTemplateInstance&&(i=$common.getBounds(t),!u&&r.x<=i.x||u&&r.y<=i.y))return t;return null},_validate:function(){for(var t=this._dropCueTemplateInstance==null||!Sys.Extended.UI.DragDropManager._getInstance().hasParent(this._dropCueTemplateInstance),i=0,n=this.get_element().firstChild;n!==null;n=n.nextSibling)n.innerHTML&&n!==this._emptyTemplateInstance&&n!==this._dropCueTemplateInstance&&i++;i>0&&(t=!1);this._setEmptyTemplateVisible(t)},_setEmptyTemplateVisible:function(n){this._emptyTemplate&&(n?this._emptyTemplateInstance?Sys.Extended.UI.DragDropManager._getInstance().hasParent(this._emptyTemplateInstance)||this.get_element().appendChild(this._emptyTemplateInstance):this._emptyTemplateInstance=this._emptyTemplate.createInstance(this.get_element()).instanceElement:this._emptyTemplateInstance&&Sys.Extended.UI.DragDropManager._getInstance().hasParent(this._emptyTemplateInstance)&&this.get_element().removeChild(this._emptyTemplateInstance))},_getFloatContainer:function(){if(this._floatContainerInstance)Sys.Extended.UI.DragDropManager._getInstance().hasParent(this._floatContainerInstance)||document.body.appendChild(this._floatContainerInstance);else{this._floatContainerInstance=document.createElement(this.get_element().tagName);var n="0px 0px 0px 0px";this._floatContainerInstance.style.position="absolute";this._floatContainerInstance.style.padding=n;this._floatContainerInstance.style.margin=n;this._floatContainerInstance.className="dragVisualContainer";document.body.appendChild(this._floatContainerInstance)}return this._floatContainerInstance}};Sys.Extended.UI.DragDropList.registerClass("Sys.Extended.UI.DragDropList",Sys.Extended.UI.BehaviorBase,Sys.Extended.UI.IDragSource,Sys.Extended.UI.IDropTarget,Sys.IDisposable);Sys.Extended.UI.DragDropWatcher=function(n){Sys.Extended.UI.DragDropWatcher.initializeBase(this,[n]);this._childList=[];this._inProgressDrops={};this._postbackCode=null;this._callbackCssStyle=null;this._argReplaceString=null;this._argContextString=null;this._argErrorString=null;this._argSuccessString=null};Sys.Extended.UI.DragDropWatcher.prototype={dispose:function(){Sys.Extended.UI.DragDropWatcher.callBaseMethod(this,"dispose")},initialize:function(){Sys.Extended.UI.DragDropWatcher.callBaseMethod(this,"initialize");this._saveChildOrder()},add_reorderComplete:function(n){this.get_events().addHandler("reorderComplete",n)},remove_reorderComplete:function(n){this.get_events().removeHandler("reorderComplete",n)},raiseReorderComplete:function(){var n=this.get_events().getHandler("reorderComplete");n&&n(this,Sys.EventArgs.Empty)},findChild:function(n,t){for(var i,u=0,f=n.childNodes,r=0;r<f.length;r++)if(i=f[r],i!=null&&i.nodeName=="LI"){if(i.id==t)return u;u++}return-1},canDrop:function(n,t,i){var u,r;if(this._inProgressDrops&&this._inProgressDrops.length>0)return!1;if(u=Sys.Extended.UI.DragDropWatcher.callBaseMethod(this,"canDrop",[n,t,i]),u){var o=$common.getBounds(i),e,f=!1,s=this.get_element();for(r=s.firstChild;r!=null&&!f;r=r.nextSibling)if(r.id){if(e=$common.getBounds(r),o.y<=e.y)break;f=r.id.lastIndexOf("Insert",r.id.length-6)!=-1}u=!f}return u},drop:function(n,t,i){var r,u,f;(Sys.Extended.UI.DragDropWatcher.callBaseMethod(this,"drop",[n,t,i]),r=i.id,this._postbackCode&&r)&&(u=this.findChild(this.get_element(),r),Sys.Debug.assert(u!=-1,String.format(Sys.Extended.UI.Resources.ReorderList_DropWatcherBehavior_NoChild,r)),f=this._getSavedChildIndex(r),u!=-1&&u!=f&&(this._saveChildOrder(),this.doPostBack(r,u,f)))},_setupDropState:function(n,t,i){if(n){var r=$get(n);this._inProgressDrops[n]={oldCss:r.className,newIndex:t,oldIndex:i};this._callbackCssStyle&&(r.className=this._callbackCssStyle)}},_onDropCallback:function(n){var t,i;if(n)return this.set_ClientState("true"),t=this._inProgressDrops[n],t&&(i=$get(n),this._callbackCssStyle&&(i.className=t.oldCss),delete this._inProgressDrops[n]),t},doPostBack:function(n,t,i){var f=this._inProgressDrops[n],u,r;f||(u="reorder:"+n+":"+i.toString()+":"+t.toString(),r=this._postbackCode.replace(this._argReplaceString,u),this._argSuccessString&&(r=r.replace(this._argSuccessString,"callbackSuccessStub")),this._argErrorString&&(r=r.replace(this._argErrorString,"callbackErrorStub")),this._argContextString&&(r=r.replace(this._argContextString,this.get_id()+":"+n)),this._setupDropState(n,t,i),window.setTimeout(r,0))},_onCallbackSuccess:function(n,t){n&&n.length>0?this._onCallbackError(n,t):(this._onDropCallback(t),this.raiseReorderComplete())},_onCallbackError:function(n,t){var i=this._onDropCallback(t);(i.oldIndex||i.newIndex)&&(this._saveChildOrder(),this.doReorder(i.newIndex,i.oldIndex,!0));alert(String.format(Sys.Extended.UI.Resources.ReorderList_DropWatcherBehavior_CallbackError,n))},doReorder:function(n,t,i){var f=this.get_element(),u=this._childList,r,e,o,s;if(n>=0&&u.length>n&&n!=t){if(r=$get(u[n]),e=this._inProgressDrops[r.id],e)return;if(r){t>n&&t++;o=t>=u.length;try{f.removeChild(r)}catch(f){}o?f.appendChild(r):(s=$get(u[t]),f.insertBefore(r,s));i?(this._saveChildOrder(),this.raiseReorderComplete()):this.doPostBack(r.id,t,n)}}},getItem:function(n){return this._childList||this._saveChildOrder(),this._childList[n]},_getSavedChildIndex:function(n){if(this._childList&&n)for(var t=0;t<this._childList.length;t++)if(n==this._childList[t])return t;return-1},_saveChildOrder:function(){var i=this.get_element(),t,r,n;if(i)for(t=i.childNodes,this._childList=[],r=0,n=0;n<t.length;n++)t[n]&&t[n].parentNode===i&&t[n].tagName&&t[n].tagName.toLowerCase()=="li"&&(this._childList[r++]=t[n].id)},get_argReplaceString:function(){return this._argReplaceString},set_argReplaceString:function(n){this._argReplaceString!=n&&(this._argReplaceString=n,this.raisePropertyChanged("argReplaceString"))},get_argContextString:function(){return this._argContextString},set_argContextString:function(n){this._argContextString!=n&&(this._argContextString=n,this.raisePropertyChanged("argContextString"))},get_argErrorString:function(){return this._argErrorString},set_argErrorString:function(n){this._argErrorString!=n&&(this._argErrorString=n,this.raisePropertyChanged("argErrorString"))},get_argSuccessString:function(){return this._argSuccessString},set_argSuccessString:function(n){this._argSuccessString!=n&&(this._argSuccessString=n,this.raisePropertyChanged("argSuccessString"))},get_postbackCode:function(){return this._postbackCode},set_postbackCode:function(n){this._postbackCode!=n&&(this._postbackCode=n,this.raisePropertyChanged("postbackCode"))},get_callbackCssStyle:function(){return this._callbackCssStyle},set_callbackCssStyle:function(n){this._callbackCssStyle!=n&&(this._callbackCssStyle=n,this.raisePropertyChanged("callbackCssStyle"))}};Sys.Extended.UI.DragDropWatcher.registerClass("Sys.Extended.UI.DragDropWatcher",Sys.Extended.UI.DragDropList);