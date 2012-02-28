function clipboard_copy(c_no) {
   if (document.all && document.c_copy.elements[c_no].value && navigator.userAgent.match(/windows/i)) {
      copy_obj = document.c_copy.elements[c_no].createTextRange()
      copy_obj.execCommand("Copy")
      alert("クリップボードにコピー完了");
   }
}