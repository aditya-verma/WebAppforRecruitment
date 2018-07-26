<!DOCTYPE html>

<body>
<!------------This is header part------------->
<div class="container">
    <form>
        <table class="table table-responsive table-bordered" id="makeEditable">
            <thead>
                <th colspan="2"><label class="text">Degree</label></th>
                <th colspan="2"><label class="text" >Discipline</label></th>
                <th colspan="2"><label class="text" >Institute</label></th>
                <th colspan="1"><label class="text" >University/Board</label></th>
                <th colspan="1"><label class="text" >Maks/CGPA</label></th>
                <th colspan="1"><label class="text" >Max Marks/CGPA</label></th>
                <th colspan="1"><label class="text" >%Marks/CGPA</label></th>
                <th colspan="1"><label class="text" >Division</label></th>
                <th colspan="1"><label class="text" >Year</label></th>
            </thead>

            <tr>
                <div class="row">
                    <td colspan="2"><input type="text" placeholder="NIL" name="degree"></td>
                    <td colspan="2"><input type="text" placeholder="NIL" name="discipline"></td>
                    <td colspan="2"><input type="text" placeholder="NIL" name="institute"></td>
                    <td colspan="1"><input type="text" placeholder="NIL" name="university"></td>
                    <td colspan="1"><input type="text" placeholder="NIL" name="marks"></td>
                    <td colspan="1"><input type="text" placeholder="NIL" name="maxmarks"></td>
                    <td colspan="1"><input type="text" placeholder="NIL" name="percent"></td>
                    <td colspan="1"><input type="text" placeholder="NIL" name="division"></td>
                    <td colspan="1"><input type="text" placeholder="NIL" name="year"></td>
                </div>
            </tr>
        </table>
        <div class="col-md-12 mb-3" style="margin: 0;text-align: center">
            <button class="btn btn-dark btn-" id="reset"  type="reset">Reset</button>
        </div>
    <div class="col-md-12 " style="margin: 0;text-align: center">
        <button class="btn btn-dark " id="but_add"  onclick="add()">Add New Row</button>
    </div>

    <script>
        function add() {
            $("#makeEditable").append("<tr><td colspan=\"2\"><input type=\"text\" placeholder=\"NIL\" name=\"degree\"></td><td colspan=\"2\"><input type=\"text\" placeholder=\"NIL\" name=\"discipline\"></td><td colspan=\"2\"><input type=\"text\" placeholder=\"NIL\" name=\"institute\"></td><td colspan=\"1\"><input type=\"text\" placeholder=\"NIL\" name=\"university\"></td><td colspan=\"1\"><input type=\"text\" placeholder=\"NIL\" name=\"marks\"></td><td colspan=\"1\"><input type=\"text\" placeholder=\"NIL\" name=\"maxmarks\"></td><tdcolspan=\"1\"><input type=\"text\" placeholder=\"NIL\" name=\"percent\"></td><td colspan=\"1\"><input type=\"text\" placeholder=\"NIL\" name=\"division\"></td><td colspan=\"1\"><input type=\"text\" placeholder=\"NIL\" name=\"year\"></td><td colspan=\"1\"><input type=\"text\" placeholder=\"NIL\" name=\"year\"></tr>");
        }
    </script>
    </form>
</div>

</body>
</html>