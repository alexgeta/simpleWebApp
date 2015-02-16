/**
 *
 */

$(document).ready(function(){

    /*page list.jsp*/

    $("#addVideoButton").click(function(){
        var empty = $("input[name=videoId]").val() == "";
        if(!empty) {
            var addVideoForm = $("#addVideoForm");
            addVideoForm.attr("action","/add");
            addVideoForm.submit();
        }else alert("Please input videoID!");
    });

    $("#deleteButton").click( function(){
        var atLeastOneIsChecked = $(".checkbox").is(":checked");
        if (atLeastOneIsChecked){
            var tableForm = $("#tableForm");
            tableForm.attr("action", "/delete");
            tableForm.submit();
        }else alert("Select at least one item!");
    });

    $('#editButton').click(function () {
        var checkedCount = $("[type='checkbox']:checked").length;
        if(checkedCount < 2 ) {
            self.name = "list";
            var tableForm = $("#tableForm");
            tableForm.submit(function() {
                this.target = 'edit';
                this.action = '/edit';
                window.open('', 'edit', 'width=400,height=300,top=200,left=450');
            });
            tableForm.submit();
        }else alert("Please select just one row to be edited");
    });

    $('#refreshButton').click(function(){
        location.href = '/';
    });

    /*page edit.jsp*/

    $("#addButton").click(function(){
        addOrSave();
    });

    $("#saveButton").click(function(){
        addOrSave();
    });

    $("#cancelButton").click(function(){
        opener.$("#refreshButton").click();
        self.close();
    });

    function addOrSave(){
        var editForm = $("#editForm");
        editForm.submit(function(){
            this.target = opener.name;
            this.action = "/update";
            self.close();
        });
        editForm.submit();
    }

});

