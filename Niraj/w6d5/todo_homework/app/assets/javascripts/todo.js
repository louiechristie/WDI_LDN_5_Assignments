
    function updateItem() {
      var cbId = this.id.replace("cb_", "");
      var itemText = document.getElementById("item_ + cbId");

    if(this.checked){
       itemText.className = "checked"
     } else {
      itemText.className = ""

     }  
    }

    function renameItem(){
    var newText = prompt("What would you like to rename it to?")
    if (!newText || newText == "" || newText == " " ) {
      return false;
      this.innerText = newText;
    }
    }

    function addNewItem(list, itemText) {

      var date = new Date();
      var id = "" + date.getHours() + date.getMinutes() + date.getSeconds() + date.getMilliseconds();

      var listItem = document.createElement("li");

      var checkBox = document.createElement("input");
      checkBox.type = "checkbox";
      checkBox.id = "cb_" + id;
      checkBox.onclick = updateItem;


      var span = document.createElement("span");
      span.id = "item_" + id;
      span.innerText = itemText;
      span.onclick = renameItem;


      listItem.appendChild(checkBox);
      listItem.appendChild(span);


      list.appendChild(listItem);

    }

    var inItemText = document.getElementById("inItemText"); 
    inItemText.onkeyup = function(event) {

      if (event.which == 13) {
        var itemText = addText.value;

        if (itemText = "" || itemText = " ") {
          return false;
        }

      addNewItem(document.getElementById("todoList"), itemText);

      inItemText.focus();
      inItemText.select();
      }
    };


