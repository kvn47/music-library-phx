(window["webpackJsonp"]=window["webpackJsonp"]||[]).push([["dfc65842"],{"504c":function(t,e,n){var o=n("9e1e"),a=n("0d58"),i=n("6821"),r=n("52a7").f;t.exports=function(t){return function(e){var n,s=i(e),l=a(s),c=l.length,u=0,d=[];while(c>u)n=l[u++],o&&!r.call(s,n)||d.push(t?[n,s[n]]:s[n]);return d}}},"50d1":function(t,e,n){"use strict";n.r(e);var o=function(){var t=this,e=t.$createElement,n=t._self._c||e;return n("q-layout",{attrs:{view:"hHh lpr lFf"}},[n("q-header",{staticClass:"bg-primary text-white",attrs:{reveal:"",elevated:""}},[n("q-toolbar",[n("q-toolbar-title",[n("q-btn",{attrs:{to:{name:"home"},icon:"fas fa-arrow-left",flat:""}}),t._v("\n          Notes\n        ")],1),n("q-space"),n("q-btn",{attrs:{icon:"fas fa-plus",flat:"",round:"",dense:""},on:{click:t.new_note}})],1),n("q-tabs",{attrs:{"indicator-color":"white","active-color":t.current_kind_color,align:"justify"}},[t._l(t.note_kinds,function(t,e){return[n("q-route-tab",{key:e,attrs:{name:e,icon:t.icon,color:t.color,to:{name:"notes",params:{kind:e}}}})]})],2)],1),n("q-page-container",[n("router-view")],1)],1)},a=[],i=n("bea4"),r={name:"NotesLayout",data:function(){return{}},computed:{note_kinds:function(){return this.$store.state.notes.note_kinds},current_kind_color:function(){return void 0===this.$route.params.kind?"accent":this.note_kinds[this.$route.params.kind].color}},methods:{new_note:function(){this.$q.dialog({component:i["a"],root:this.$root}).onOk(function(){console.log("New note OK")})}}},s=r,l=n("2877"),c=Object(l["a"])(s,o,a,!1,null,null,null);e["default"]=c.exports},bea4:function(t,e,n){"use strict";var o=function(){var t=this,e=t.$createElement,n=t._self._c||e;return n("q-dialog",{ref:"note_form",on:{hide:t.cancel}},[n("q-card",{staticClass:"q-dialog-plugin"},[n("form",{on:{submit:function(e){return e.preventDefault(),t.submit_form(e)}}},[n("q-card-section",[n("q-btn-toggle",{attrs:{options:t.kind_options,flat:""},model:{value:t.note.kind,callback:function(e){t.$set(t.note,"kind",e)},expression:"note.kind"}}),n("q-input",{attrs:{label:"Artist",type:"text",autofocus:"",clearable:""},model:{value:t.note.artist,callback:function(e){t.$set(t.note,"artist",e)},expression:"note.artist"}}),n("q-input",{attrs:{label:"Album",type:"text",clearable:""},model:{value:t.note.album,callback:function(e){t.$set(t.note,"album",e)},expression:"note.album"}}),t.is_download_url_visible?n("q-input",{attrs:{label:"Download URL",type:"url",clearable:""},model:{value:t.note.download_url,callback:function(e){t.$set(t.note,"download_url",e)},expression:"note.download_url"}}):t._e(),t.is_download_path_visible?n("q-input",{attrs:{label:"Download path",type:"text",clearable:""},model:{value:t.note.download_path,callback:function(e){t.$set(t.note,"download_path",e)},expression:"note.download_path"}}):t._e(),t.is_release_date_visible?n("q-field",{attrs:{label:"Release date","stack-label":""},scopedSlots:t._u([{key:"control",fn:function(){return[n("div",{staticClass:"self-center full-width no-outline",attrs:{tabindex:"0"}},[t._v(t._s(t.release_date_preview))])]},proxy:!0},{key:"append",fn:function(){return[n("q-icon",{staticClass:"cursor-pointer",attrs:{name:"fas fa-calendar"}},[n("q-popup-proxy",{ref:"date_picker_popup"},[n("q-date",{attrs:{value:t.release_date_for_picker,"first-day-of-week":1,label:"Release date","today-btn":""},on:{input:t.set_release_date}})],1)],1)]},proxy:!0}],null,!1,2062756856)}):t._e(),n("q-input",{attrs:{label:"Details",type:"textarea",rows:"3",clearable:""},model:{value:t.note.details,callback:function(e){t.$set(t.note,"details",e)},expression:"note.details"}})],1),n("q-separator"),n("q-card-actions",{attrs:{align:"around"}},[n("q-btn",{staticClass:"col-5",attrs:{label:"Cancel"},on:{click:t.cancel}}),n("q-btn",{staticClass:"col-5",attrs:{type:"submit",label:"Save",color:"primary",loading:t.submitting},scopedSlots:t._u([{key:"loading",fn:function(){return[n("q-spinner-bars")]},proxy:!0}])})],1)],1)])],1)},a=[],i=(n("ac6a"),n("cadf"),n("06db"),n("ffc1"),n("bd4c")),r={name:"NoteForm",props:{note:{type:Object,default:function(){return{kind:"listen",release_date:new Date}}}},data:function(){return{submitting:!1}},computed:{kind_options:function(){return Object.entries(this.$store.state.notes.note_kinds).map(function(t){return{icon:t[1].icon,value:t[0]}})},is_download_url_visible:function(){return"download"===this.note.kind},is_download_path_visible:function(){return"download"===this.note.kind},is_release_date_visible:function(){return"await"===this.note.kind},release_date_preview:function(){return void 0===this.note.release_date?null:this.note.release_date.toLocaleDateString("ru-RU")},release_date_for_picker:function(){return i["b"].formatDate(this.note.release_date,"YYYY/MM/DD")}},methods:{show:function(){this.$refs.note_form.show()},hide:function(){this.$refs.note_form.hide()},set_release_date:function(t){this.note.release_date=new Date(t),this.$refs.date_picker_popup.hide()},submit_form:function(){void 0===this.note.id?this.$store.dispatch("create_note",this.note):this.$store.dispatch("update_note",this.note),this.$emit("ok"),this.hide()},cancel:function(){this.hide()}}},s=r,l=n("2877"),c=Object(l["a"])(s,o,a,!1,null,null,null);e["a"]=c.exports},ffc1:function(t,e,n){var o=n("5ca1"),a=n("504c")(!0);o(o.S,"Object",{entries:function(t){return a(t)}})}}]);