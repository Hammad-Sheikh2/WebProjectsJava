package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class index_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List _jspx_dependants;

  private javax.el.ExpressionFactory _el_expressionfactory;
  private org.apache.AnnotationProcessor _jsp_annotationprocessor;

  public Object getDependants() {
    return _jspx_dependants;
  }

  public void _jspInit() {
    _el_expressionfactory = _jspxFactory.getJspApplicationContext(getServletConfig().getServletContext()).getExpressionFactory();
    _jsp_annotationprocessor = (org.apache.AnnotationProcessor) getServletConfig().getServletContext().getAttribute(org.apache.AnnotationProcessor.class.getName());
  }

  public void _jspDestroy() {
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;


    try {
      response.setContentType("text/html");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;

      out.write("<html>\n");
      out.write("<head>\n");
      out.write("    <meta charset=\"utf-8\">\n");
      out.write("    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1\">\n");
      out.write("    <link rel=\"stylesheet\" href=\"https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css\">\n");
      out.write("    <script src=\"https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js\"></script>\n");
      out.write("    <script src=\"https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js\"></script>\n");
      out.write("    <script src=\"https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js\"></script>\n");
      out.write("    <title>Soccer World Championship</title>\n");
      out.write("    <style>\n");
      out.write("        body{\n");
      out.write("            display: flex;\n");
      out.write("            flex-wrap: wrap;\n");
      out.write("            justify-content: center;\n");
      out.write("            align-items: center;\n");
      out.write("            padding: 15px;\n");
      out.write("            background-color: #4158D0;\n");
      out.write("            background-image: linear-gradient(43deg, #4158D0 0%, #C850C0 46%, #FFCC70 100%);\n");
      out.write("\n");
      out.write("        }\n");
      out.write("        .gamePlanMenu{\n");
      out.write("            color: gray;\n");
      out.write("            border-bottom: 3px solid white;\n");
      out.write("        }\n");
      out.write("        .gamePlanMenu:hover{\n");
      out.write("            border-bottom: 3px solid gray;\n");
      out.write("        }\n");
      out.write("        .gamePlanMenu:focus{\n");
      out.write("            color: black;\n");
      out.write("            border-bottom: 3px solid black;\n");
      out.write("        }\n");
      out.write("\n");
      out.write("        .btn-grad {background-image: linear-gradient(to right, #1F1C2C 0%, #928DAB  51%, #1F1C2C  100%)}\n");
      out.write("        .btn-grad {\n");
      out.write("            margin: 10px;\n");
      out.write("            padding: 15px 45px;\n");
      out.write("            text-align: center;\n");
      out.write("            text-transform: uppercase;\n");
      out.write("            transition: 0.5s;\n");
      out.write("            background-size: 200% auto;\n");
      out.write("            color: white;\n");
      out.write("            box-shadow: 0 0 20px #eee;\n");
      out.write("            border-radius: 10px;\n");
      out.write("            display: block;\n");
      out.write("        }\n");
      out.write("\n");
      out.write("        .btn-grad:hover {\n");
      out.write("            background-position: right center; /* change the direction of the change here */\n");
      out.write("            color: #fff;\n");
      out.write("            text-decoration: none;\n");
      out.write("        }\n");
      out.write("\n");
      out.write("    </style>\n");
      out.write("</head>\n");
      out.write("<body>\n");
      out.write("    <div class=\"container\">\n");
      out.write("        <!--From Line 57 to 121 It display the UI Block where you enter Team Names-->\n");
      out.write("        <div id=\"TeamsNamePortion\" class=\"card\" style=\"border: none\">\n");
      out.write("            <div class=\"card-header text-white\" style=\"background: #380038;\">\n");
      out.write("                Soccer World Championship\n");
      out.write("            </div>\n");
      out.write("            <div class=\"card-body\">\n");
      out.write("                <h5 class=\"card-title\">Qualification Group</h5>\n");
      out.write("                <div class=\"card mt-3\">\n");
      out.write("                    <div class=\"card-header\">\n");
      out.write("                        Team 1\n");
      out.write("                    </div>\n");
      out.write("                    <div class=\"card-body d-flex flex-column justify-content-center align-item-center\">\n");
      out.write("                        <img class=\"mx-auto\" src=\"Images/team1.png\" style=\"width: 100px;height: 100px\">\n");
      out.write("                        <input id=\"TBNameTeam1\" class=\"mx-auto mt-2\" type=\"text\" class=\"form-control col-md-8\" value=\"Team 1\"></input>\n");
      out.write("                    </div>\n");
      out.write("                </div>\n");
      out.write("                <div class=\"card mt-3\">\n");
      out.write("                    <div class=\"card-header\">\n");
      out.write("                        Team 2\n");
      out.write("                    </div>\n");
      out.write("                    <div class=\"card-body d-flex flex-column justify-content-center align-item-center\">\n");
      out.write("                        <img class=\"mx-auto\" src=\"Images/team2.png\" style=\"width: 100px;height: 100px\">\n");
      out.write("                        <input id=\"TBNameTeam2\" class=\"mx-auto mt-2\" type=\"text\" class=\"form-control col-md-8 mt-2\" value=\"Team 2\"></input>\n");
      out.write("                    </div>\n");
      out.write("                </div>\n");
      out.write("                <div class=\"card mt-3\">\n");
      out.write("                    <div class=\"card-header\">\n");
      out.write("                        Team 3\n");
      out.write("                    </div>\n");
      out.write("                    <div class=\"card-body d-flex flex-column justify-content-center align-item-center\">\n");
      out.write("                        <img class=\"mx-auto\" src=\"Images/team3.png\" style=\"width: 100px;height: 100px\">\n");
      out.write("                        <input id=\"TBNameTeam3\"  class=\"mx-auto mt-2\" type=\"text\" class=\"form-control col-md-8 mt-2\" value=\"Team 3\"></input>\n");
      out.write("                    </div>\n");
      out.write("                </div>\n");
      out.write("                <div class=\"card mt-3\">\n");
      out.write("                    <div class=\"card-header\">\n");
      out.write("                        Team 4\n");
      out.write("                    </div>\n");
      out.write("                    <div class=\"card-body d-flex flex-column justify-content-center align-item-center\">\n");
      out.write("                        <img class=\"mx-auto\" src=\"Images/team4.png\" style=\"width: 100px;height: 100px\">\n");
      out.write("                        <input id=\"TBNameTeam4\" class=\"mx-auto mt-2\" type=\"text\" class=\"form-control col-md-8 mt-2\" value=\"Team 4\"></input>\n");
      out.write("                    </div>\n");
      out.write("                </div>\n");
      out.write("                <div class=\"card mt-3\">\n");
      out.write("                    <div class=\"card-header\">\n");
      out.write("                        Team 5\n");
      out.write("                    </div>\n");
      out.write("                    <div class=\"card-body d-flex flex-column justify-content-center align-item-center\">\n");
      out.write("                        <img class=\"mx-auto\" src=\"Images/team5.png\" style=\"width: 100px;height: 100px\">\n");
      out.write("                        <input id=\"TBNameTeam5\" class=\"mx-auto mt-2\" type=\"text\" class=\"form-control col-md-8 mt-2\" value=\"Team 5\"></input>\n");
      out.write("                    </div>\n");
      out.write("                </div>\n");
      out.write("                <div class=\"card mt-3\">\n");
      out.write("                    <div class=\"card-header\">\n");
      out.write("                        Team 6\n");
      out.write("                    </div>\n");
      out.write("                    <div class=\"card-body d-flex flex-column justify-content-center align-item-center\">\n");
      out.write("                        <img class=\"mx-auto\" src=\"Images/team6.png\" style=\"width: 100px;height: 100px\">\n");
      out.write("                        <input id=\"TBNameTeam6\" class=\"mx-auto mt-2\" type=\"text\" class=\"form-control col-md-8 mt-2\" value=\"Team 6\"></input>\n");
      out.write("                    </div>\n");
      out.write("                </div>\n");
      out.write("                <p class=\"card-text\">Edit Team Names.</p>\n");
      out.write("                <button onclick=\"SubmitNamesAndGoToGamePlan()\" class=\"btn-grad\">Go To Game Plan</button>\n");
      out.write("            </div>\n");
      out.write("        </div>\n");
      out.write("        <!--From Line 122 to 133 It display the UI Block where you see Match Fixtures and Standings but in this\n");
      out.write("        UI Design will be randomly change according to data-->\n");
      out.write("        <div style=\"display: none;border: none\" id=\"GamesPlanPortion\" class=\"card\">\n");
      out.write("            <h5 class=\"card-header text-white\" style=\"background: #380038;\">Soccer World Championship</h5>\n");
      out.write("            <div class=\"card-body\">\n");
      out.write("                <div class=\"row\">\n");
      out.write("                    <button onclick=\"btnMatchesClicked()\" class=\"gamePlanMenu btn col-6\" style=\"box-shadow: none\">Matches</button>\n");
      out.write("                    <button onclick=\"btnStandingsClicked()\" class=\"gamePlanMenu btn col-6\" style=\"box-shadow: none\">Standings</button>\n");
      out.write("                </div>\n");
      out.write("                <div onload=\"btnMatchesClicked\" id=\"GamePlanPortionBody\"></div>\n");
      out.write("            </div>\n");
      out.write("        </div>\n");
      out.write("    </div>\n");
      out.write("    <div class=\"modal fade\" id=\"exampleModal\" tabindex=\"-1\" role=\"dialog\" aria-labelledby=\"exampleModalLabel\" aria-hidden=\"true\">\n");
      out.write("        <div class=\"modal-dialog\" role=\"document\">\n");
      out.write("            <div class=\"modal-content\">\n");
      out.write("                <div class=\"modal-header\">\n");
      out.write("                    <h5 class=\"modal-title\" id=\"exampleModalLabel\">Match No</h5>\n");
      out.write("                    <button type=\"button\" class=\"close\" data-dismiss=\"modal\" aria-label=\"Close\">\n");
      out.write("                        <span aria-hidden=\"true\">&times;</span>\n");
      out.write("                    </button>\n");
      out.write("                </div>\n");
      out.write("                <div class=\"modal-body\">\n");
      out.write("                    <label id=\"resultTeam1GoalsLbl\" ></label>\n");
      out.write("                    <input id=\"resultTeam1Goals\" class=\"form-control\" type=\"number\">\n");
      out.write("                    <label id=\"resultTeam2GoalsLbl\" class=\"mt-2\" ></label>\n");
      out.write("                    <input id=\"resultTeam2Goals\" class=\"form-control\" type=\"number\">\n");
      out.write("                    <input id=\"resultIndex\" style=\"display: none\" type=\"number\">\n");
      out.write("                    <input id=\"resultMatch\" style=\"display: none\" type=\"text\">\n");
      out.write("                </div>\n");
      out.write("                <div class=\"modal-footer\">\n");
      out.write("                    <button id=\"btnAddOrEditMatchResult\" type=\"button\" class=\"btn btn-primary\" data-dismiss=\"modal\">Save changes</button>\n");
      out.write("                </div>\n");
      out.write("            </div>\n");
      out.write("        </div>\n");
      out.write("    </div>\n");
      out.write("</body>\n");
      out.write("</html>\n");
      out.write("\n");
      out.write("<script>\n");
      out.write("    let listOfTeams;\n");
      out.write("    let listOfMatches;\n");
      out.write("    let SemiFinals;\n");
      out.write("    let Final;\n");
      out.write("    function SubmitNamesAndGoToGamePlan(){\n");
      out.write("        //This Code Send Request and Team Names as Data to Servlet to Save Names and get response all Data\n");
      out.write("        //All Data means list of Teams , list of Matches etc.\n");
      out.write("        //All the code in this page where $.ajax use send data according to function name and recieve all data.\n");
      out.write("        $.ajax({\n");
      out.write("            type:\"POST\",\n");
      out.write("            url: \"./requestHandler\",\n");
      out.write("            data:{\n");
      out.write("                action: \"SaveNames\",\n");
      out.write("                team1:document.getElementById(\"TBNameTeam1\").value,\n");
      out.write("                team2:document.getElementById(\"TBNameTeam2\").value,\n");
      out.write("                team3:document.getElementById(\"TBNameTeam3\").value,\n");
      out.write("                team4:document.getElementById(\"TBNameTeam4\").value,\n");
      out.write("                team5:document.getElementById(\"TBNameTeam5\").value,\n");
      out.write("                team6:document.getElementById(\"TBNameTeam6\").value\n");
      out.write("            },\n");
      out.write("            success:(data)=>{\n");
      out.write("                console.log(data)\n");
      out.write("                listOfTeams=data.listOfTeams\n");
      out.write("                listOfMatches=data.listOfMatches\n");
      out.write("                SemiFinals=data.listOfSemiFinals\n");
      out.write("                Final=data.finalMatch\n");
      out.write("                document.getElementById(\"TeamsNamePortion\").style.display='none'\n");
      out.write("                document.getElementById(\"GamesPlanPortion\").style.display='block'\n");
      out.write("            },\n");
      out.write("            failure:(error)=>{\n");
      out.write("                console.log(error);\n");
      out.write("            }\n");
      out.write("        });\n");
      out.write("    }\n");
      out.write("    function editMatchResultClicked(){\n");
      out.write("        let index=document.getElementById('resultIndex').value\n");
      out.write("        let team1Goals=document.getElementById('resultTeam1Goals').value\n");
      out.write("        let team2Goals=document.getElementById('resultTeam2Goals').value\n");
      out.write("        let match= document.getElementById('resultMatch').value\n");
      out.write("        $.ajax({\n");
      out.write("            type:\"POST\",\n");
      out.write("            url: \"./requestHandler\",\n");
      out.write("            data:{\n");
      out.write("                action: \"EditMatchResult\",\n");
      out.write("                team1Goals:team1Goals,\n");
      out.write("                team2Goals:team2Goals,\n");
      out.write("                index:index,\n");
      out.write("                match:match\n");
      out.write("            },\n");
      out.write("            success:(data)=>{\n");
      out.write("                console.log(data)\n");
      out.write("                listOfTeams=data.listOfTeams\n");
      out.write("                listOfMatches=data.listOfMatches\n");
      out.write("                SemiFinals=data.listOfSemiFinals\n");
      out.write("                Final=data.finalMatch\n");
      out.write("                btnMatchesClicked()\n");
      out.write("            },\n");
      out.write("            failure:(error)=>{\n");
      out.write("                console.log(error);\n");
      out.write("            }\n");
      out.write("        });\n");
      out.write("    }\n");
      out.write("    function addMatchResultClicked(){\n");
      out.write("        let index=document.getElementById('resultIndex').value\n");
      out.write("        let team1Goals=document.getElementById('resultTeam1Goals').value\n");
      out.write("        let team2Goals=document.getElementById('resultTeam2Goals').value\n");
      out.write("        let match= document.getElementById('resultMatch').value\n");
      out.write("        $.ajax({\n");
      out.write("            type:\"POST\",\n");
      out.write("            url: \"./requestHandler\",\n");
      out.write("            data:{\n");
      out.write("                action: \"AddMatchResult\",\n");
      out.write("                team1Goals:team1Goals,\n");
      out.write("                team2Goals:team2Goals,\n");
      out.write("                index:index,\n");
      out.write("                match:match\n");
      out.write("            },\n");
      out.write("            success:(data)=>{\n");
      out.write("                console.log(data)\n");
      out.write("                listOfTeams=data.listOfTeams\n");
      out.write("                listOfMatches=data.listOfMatches\n");
      out.write("                SemiFinals=data.listOfSemiFinals\n");
      out.write("                Final=data.finalMatch\n");
      out.write("                btnMatchesClicked()\n");
      out.write("            },\n");
      out.write("            failure:(error)=>{\n");
      out.write("                console.log(error);\n");
      out.write("            }\n");
      out.write("        });\n");
      out.write("    }\n");
      out.write("    function MatchResultUI(match,index,matchInfo,action){\n");
      out.write("        if(matchInfo===\"match\"){\n");
      out.write("            document.getElementById(\"exampleModalLabel\").innerText=\"Match \" + (index+1)\n");
      out.write("        }\n");
      out.write("        else if(matchInfo===\"semiFinals\"){\n");
      out.write("            document.getElementById(\"exampleModalLabel\").innerText=\"Semi Final \" + (index+1)\n");
      out.write("        }\n");
      out.write("        else {\n");
      out.write("            document.getElementById(\"exampleModalLabel\").innerText=\"Final Match\"\n");
      out.write("        }\n");
      out.write("        document.getElementById(\"resultTeam1GoalsLbl\").innerText=match.team1.name+\" Goals\"\n");
      out.write("        document.getElementById(\"resultTeam2GoalsLbl\").innerText=match.team2.name+\" Goals\"\n");
      out.write("        document.getElementById(\"resultTeam1Goals\").value=match.team1Goals\n");
      out.write("        document.getElementById(\"resultTeam2Goals\").value=match.team2Goals\n");
      out.write("        document.getElementById(\"resultIndex\").value=index\n");
      out.write("        document.getElementById(\"resultMatch\").value=matchInfo\n");
      out.write("        if(action==\"add\"){\n");
      out.write("            document.getElementById(\"btnAddOrEditMatchResult\").onclick=()=>{addMatchResultClicked()}\n");
      out.write("        }\n");
      out.write("        else {\n");
      out.write("            document.getElementById(\"btnAddOrEditMatchResult\").onclick=()=>{editMatchResultClicked()}\n");
      out.write("        }\n");
      out.write("    }\n");
      out.write("    function btnMatchesClicked(){\n");
      out.write("        let GamePlanPortionBody=document.getElementById(\"GamePlanPortionBody\");\n");
      out.write("        GamePlanPortionBody.innerHTML= \"<div>\" +\n");
      out.write("            \"<div class='card mt-3' id='GamePlanPreliminaryRounds' style='background: #F7F7F5'>\" +\n");
      out.write("            \"<div class='card-header'>Preliminary Rounds</div>\" +\n");
      out.write("            \"</div>\" +\n");
      out.write("            (SemiFinals==false?\"\":\n");
      out.write("            \"<div class='card  mt-3' id='GamePlanSemiFinals' style='background: #F7F7F5'>\" +\n");
      out.write("            \"<div class='card-header'>Semi Final Rounds</div>\" +\n");
      out.write("            \"</div>\") +\n");
      out.write("            (Final==false?\"\":\n");
      out.write("            \"<div class='card mt-3' id='GamePlanFinal' style='background: #F7F7F5'>\" +\n");
      out.write("            \"<div class='card-header'>Final</div>\" +\n");
      out.write("            \"</div>\" +\n");
      out.write("            \"</div>\")\n");
      out.write("        for (let i = 0; i < listOfMatches.length; i++) {\n");
      out.write("            let div=document.createElement(\"DIV\");\n");
      out.write("            div.className=\"my-3 mx-auto card bg-white\"\n");
      out.write("            div.style.width=\"80%\"\n");
      out.write("            if(listOfMatches[i].isMatchPlayed==true){\n");
      out.write("                div.innerHTML=\"<div class='card-text my-3 mx-3 d-flex'>\" +\n");
      out.write("                    \"<div class='mr-auto'>Match \"+(i+1)+\"</div>\" +\n");
      out.write("                    \"<div class='ml-auto' >\" +\n");
      out.write("                    \"<button id='btnResult\"+i+\"' type='button' class='btn btn-primary' data-toggle='modal' data-target='#exampleModal'>Result </button>\" +\n");
      out.write("                    \"</div>\" +\n");
      out.write("                    \"</div>\" +\n");
      out.write("                    \"<div class='d-sm-flex flex-sm-column'>\" +\n");
      out.write("                    \"<div class='align-self-start d-sm-flex ml-2'>\" +\n");
      out.write("                    \"<img src='\"+listOfMatches[i].team1.img+\"' style='width: 50px;height: 50px'>\" +\n");
      out.write("                    \"<h5 class='ml-3 my-auto'>\"+listOfMatches[i].team1.name+\"</h5>\" +\n");
      out.write("                    \"</div>\" +\n");
      out.write("                    \"<div class='align-self-center'>\" +\n");
      out.write("                    \"<div class='text-danger text-center' style='border-bottom: 2px solid indianred' > VS</div>\" +\n");
      out.write("                    \"<div>\"+listOfMatches[i].team1Goals+\" - \"+listOfMatches[i].team2Goals+\"</div>\" +\n");
      out.write("                    \"</div>\" +\n");
      out.write("                    \"<div class='align-self-end d-sm-flex mr-2 mb-3'>\" +\n");
      out.write("                    \"<h5 class='mr-2 my-auto ml-auto'>\"+listOfMatches[i].team2.name+\"</h5>\" +\n");
      out.write("                    \"<img src='\"+listOfMatches[i].team2.img+\"' style='width: 50px;height: 50px'>\" +\n");
      out.write("                    \"</div>\" +\n");
      out.write("                    \"</div>\"\n");
      out.write("            }\n");
      out.write("            else {\n");
      out.write("                div.innerHTML=\"<div class='card-text my-3 mx-3 d-flex'>\" +\n");
      out.write("                    \"<div class='mr-auto'>Match \"+(i+1)+\"</div>\" +\n");
      out.write("                    \"<div class='ml-auto' >\" +\n");
      out.write("                    \"<button id='btnResult\"+i+\"' type='button' class='btn btn-primary' data-toggle='modal' data-target='#exampleModal'>Result</button>\" +\n");
      out.write("                    \"</div>\" +\n");
      out.write("                    \"</div>\" +\n");
      out.write("                    \"<div class='d-sm-flex flex-sm-column'>\" +\n");
      out.write("                    \"<div class='align-self-start d-sm-flex ml-2'>\" +\n");
      out.write("                    \"<img src='\"+listOfMatches[i].team1.img+\"' style='width: 50px;height: 50px'>\" +\n");
      out.write("                    \"<h5 class='ml-2 my-auto'>\"+listOfMatches[i].team1.name+\"</h5>\" +\n");
      out.write("                    \"</div>\" +\n");
      out.write("                    \"<div class='align-self-center text-center'>\" +\n");
      out.write("                    \"<div class='text-danger'> VS</div>\" +\n");
      out.write("                    \"<div>Not Played Yet</div>\" +\n");
      out.write("                    \"</div>\" +\n");
      out.write("                    \"<div class='align-self-end d-sm-flex mr-2 mb-3'>\" +\n");
      out.write("                    \"<h5 class='mr-2 my-auto ml-auto'>\"+listOfMatches[i].team2.name+\"</h5>\" +\n");
      out.write("                    \"<img src='\"+listOfMatches[i].team2.img+\"' style='width: 50px;height: 50px'>\" +\n");
      out.write("                    \"</div>\" +\n");
      out.write("                    \"</div>\"\n");
      out.write("            }\n");
      out.write("            document.getElementById(\"GamePlanPreliminaryRounds\").appendChild(div)\n");
      out.write("            if(listOfMatches[i].isMatchPlayed==true){\n");
      out.write("                document.getElementById(\"btnResult\"+i).onclick=()=>MatchResultUI(listOfMatches[i],i,\"match\",\"edit\")\n");
      out.write("            }\n");
      out.write("            else {\n");
      out.write("                document.getElementById(\"btnResult\"+i).onclick=()=>MatchResultUI(listOfMatches[i],i,\"match\",\"add\")\n");
      out.write("            }\n");
      out.write("\n");
      out.write("        }\n");
      out.write("        if(SemiFinals!=false){\n");
      out.write("            for (let i = 0; i < SemiFinals.length; i++) {\n");
      out.write("                let div=document.createElement(\"DIV\");\n");
      out.write("                div.className=\"my-3 mx-auto card bg-white\"\n");
      out.write("                div.style.width=\"80%\"\n");
      out.write("                if(SemiFinals[i].isMatchPlayed==true){\n");
      out.write("                    div.innerHTML=\"<div class='card-text my-3 mx-3 d-flex'>\" +\n");
      out.write("                        \"<div class='mr-auto text-warning'>Semi Final \"+(i+1)+\"</div>\" +\n");
      out.write("                        \"<div class='ml-auto' >\" +\n");
      out.write("                        \"<button id='btnResult\"+(i+6)+\"' type='button' class='btn btn-primary' data-toggle='modal' data-target='#exampleModal'>Result </button>\" +\n");
      out.write("                        \"</div>\" +\n");
      out.write("                        \"</div>\" +\n");
      out.write("                        \"<div class='d-sm-flex flex-sm-column'>\" +\n");
      out.write("                        \"<div class='align-self-start d-sm-flex ml-2'>\" +\n");
      out.write("                        \"<img src='\"+SemiFinals[i].team1.img+\"' style='width: 50px;height: 50px'>\" +\n");
      out.write("                        \"<h5 class='ml-3 my-auto'>\"+SemiFinals[i].team1.name+\"</h5>\" +\n");
      out.write("                        \"</div>\" +\n");
      out.write("                        \"<div class='align-self-center'>\" +\n");
      out.write("                        \"<div class='text-danger text-center' style='border-bottom: 2px solid indianred' > VS</div>\" +\n");
      out.write("                        \"<div>\"+SemiFinals[i].team1Goals+\" - \"+SemiFinals[i].team2Goals+\"</div>\" +\n");
      out.write("                        \"</div>\" +\n");
      out.write("                        \"<div class='align-self-end d-sm-flex mr-2 mb-3'>\" +\n");
      out.write("                        \"<h5 class='mr-2 my-auto ml-auto'>\"+SemiFinals[i].team2.name+\"</h5>\" +\n");
      out.write("                        \"<img src='\"+SemiFinals[i].team2.img+\"' style='width: 50px;height: 50px'>\" +\n");
      out.write("                        \"</div>\" +\n");
      out.write("                        \"</div>\"\n");
      out.write("                }\n");
      out.write("                else {\n");
      out.write("                    div.innerHTML=\"<div class='card-text my-3 mx-3 d-flex'>\" +\n");
      out.write("                        \"<div class='mr-auto text-warning'>Semi Final \"+(i+1)+\"</div>\" +\n");
      out.write("                        \"<div class='ml-auto' >\" +\n");
      out.write("                        \"<button id='btnResult\"+(i+6)+\"' type='button' class='btn btn-primary' data-toggle='modal' data-target='#exampleModal'>Result</button>\" +\n");
      out.write("                        \"</div>\" +\n");
      out.write("                        \"</div>\" +\n");
      out.write("                        \"<div class='d-sm-flex flex-sm-column'>\" +\n");
      out.write("                        \"<div class='align-self-start d-sm-flex ml-2'>\" +\n");
      out.write("                        \"<img src='\"+SemiFinals[i].team1.img+\"' style='width: 50px;height: 50px'>\" +\n");
      out.write("                        \"<h5 class='ml-2 my-auto'>\"+SemiFinals[i].team1.name+\"</h5>\" +\n");
      out.write("                        \"</div>\" +\n");
      out.write("                        \"<div class='align-self-center text-center'>\" +\n");
      out.write("                        \"<div class='text-danger'> VS</div>\" +\n");
      out.write("                        \"<div>Not Played Yet</div>\" +\n");
      out.write("                        \"</div>\" +\n");
      out.write("                        \"<div class='align-self-end d-sm-flex mr-2 mb-3'>\" +\n");
      out.write("                        \"<h5 class='mr-2 my-auto ml-auto'>\"+SemiFinals[i].team2.name+\"</h5>\" +\n");
      out.write("                        \"<img src='\"+SemiFinals[i].team2.img+\"' style='width: 50px;height: 50px'>\" +\n");
      out.write("                        \"</div>\" +\n");
      out.write("                        \"</div>\"\n");
      out.write("                }\n");
      out.write("                document.getElementById(\"GamePlanSemiFinals\").appendChild(div)\n");
      out.write("                if(SemiFinals[i].isMatchPlayed==true){\n");
      out.write("                    document.getElementById(\"btnResult\"+(i+6)).onclick=()=>MatchResultUI(SemiFinals[i],i,\"semiFinals\",\"edit\")\n");
      out.write("                }\n");
      out.write("                else {\n");
      out.write("                    document.getElementById(\"btnResult\"+(i+6)).onclick=()=>MatchResultUI(SemiFinals[i],i,\"semiFinals\",\"add\")\n");
      out.write("                }\n");
      out.write("            }\n");
      out.write("        }\n");
      out.write("        if(Final!=false){\n");
      out.write("            let div=document.createElement(\"DIV\");\n");
      out.write("            div.className=\"my-3 mx-auto card bg-white\"\n");
      out.write("            div.style.width=\"80%\"\n");
      out.write("            if(Final.isMatchPlayed==true){\n");
      out.write("                div.innerHTML=\"<div class='card-text my-3 mx-3 d-flex'>\" +\n");
      out.write("                    \"<div class='mr-auto text-success'>Final Match</div>\" +\n");
      out.write("                    \"<div class='ml-auto' >\" +\n");
      out.write("                    \"<button id='btnResultFinal' type='button' class='btn btn-primary' data-toggle='modal' data-target='#exampleModal'>Result </button>\" +\n");
      out.write("                    \"</div>\" +\n");
      out.write("                    \"</div>\" +\n");
      out.write("                    \"<div class='d-sm-flex flex-sm-column'>\" +\n");
      out.write("                    \"<div class='align-self-start d-sm-flex ml-2'>\" +\n");
      out.write("                    \"<img src='\"+Final.team1.img+\"' style='width: 50px;height: 50px'>\" +\n");
      out.write("                    \"<h5 class='ml-3 my-auto'>\"+Final.team1.name+\"</h5>\" +\n");
      out.write("                    \"</div>\" +\n");
      out.write("                    \"<div class='align-self-center'>\" +\n");
      out.write("                    \"<div class='text-danger text-center' style='border-bottom: 2px solid indianred' > VS</div>\" +\n");
      out.write("                    \"<div>\"+Final.team1Goals+\" - \"+Final.team2Goals+\"</div>\" +\n");
      out.write("                    \"</div>\" +\n");
      out.write("                    \"<div class='align-self-end d-sm-flex mr-2 mb-3'>\" +\n");
      out.write("                    \"<h5 class='mr-2 my-auto ml-auto'>\"+Final.team2.name+\"</h5>\" +\n");
      out.write("                    \"<img src='\"+Final.team2.img+\"' style='width: 50px;height: 50px'>\" +\n");
      out.write("                    \"</div>\" +\n");
      out.write("                    \"</div>\"\n");
      out.write("            }\n");
      out.write("            else {\n");
      out.write("                div.innerHTML=\"<div class='card-text my-3 mx-3 d-flex'>\" +\n");
      out.write("                    \"<div class='mr-auto text-success'>Final Match</div>\" +\n");
      out.write("                    \"<div class='ml-auto' >\" +\n");
      out.write("                    \"<button id='btnResultFinal' type='button' class='btn btn-primary' data-toggle='modal' data-target='#exampleModal'>Result</button>\" +\n");
      out.write("                    \"</div>\" +\n");
      out.write("                    \"</div>\" +\n");
      out.write("                    \"<div class='d-sm-flex flex-sm-column'>\" +\n");
      out.write("                    \"<div class='align-self-start d-sm-flex ml-2'>\" +\n");
      out.write("                    \"<img src='\"+Final.team1.img+\"' style='width: 50px;height: 50px'>\" +\n");
      out.write("                    \"<h5 class='ml-2 my-auto'>\"+Final.team1.name+\"</h5>\" +\n");
      out.write("                    \"</div>\" +\n");
      out.write("                    \"<div class='align-self-center text-center'>\" +\n");
      out.write("                    \"<div class='text-danger'> VS</div>\" +\n");
      out.write("                    \"<div>Not Played Yet</div>\" +\n");
      out.write("                    \"</div>\" +\n");
      out.write("                    \"<div class='align-self-end d-sm-flex mr-2 mb-3'>\" +\n");
      out.write("                    \"<h5 class='mr-2 my-auto ml-auto'>\"+Final.team2.name+\"</h5>\" +\n");
      out.write("                    \"<img src='\"+Final.team2.img+\"' style='width: 50px;height: 50px'>\" +\n");
      out.write("                    \"</div>\" +\n");
      out.write("                    \"</div>\"\n");
      out.write("            }\n");
      out.write("            document.getElementById(\"GamePlanFinal\").appendChild(div)\n");
      out.write("            if(Final.isMatchPlayed==true){\n");
      out.write("                document.getElementById(\"btnResultFinal\").onclick=()=>MatchResultUI(Final,0,\"final\",\"edit\")\n");
      out.write("            }\n");
      out.write("            else {\n");
      out.write("                document.getElementById(\"btnResultFinal\").onclick=()=>MatchResultUI(Final,0,\"final\",\"add\")\n");
      out.write("            }\n");
      out.write("        }\n");
      out.write("    }\n");
      out.write("    function btnStandingsClicked(){\n");
      out.write("        let GamePlanPortionBody=document.getElementById(\"GamePlanPortionBody\");\n");
      out.write("        let div=document.createElement(\"DIV\");\n");
      out.write("        div.innerHTML=\"<div class='table-responsive'><table class='table'>\" +\n");
      out.write("            \"<thead>\" +\n");
      out.write("            \"<tr>\" +\n");
      out.write("            \"<th></th>\" +\n");
      out.write("            \"<th></th>\" +\n");
      out.write("            \"<th>MP</th>\" +\"<th>W</th>\" +\"<th>D</th>\" +\"<th>L</th>\" +\"<th>PTS</th>\" +\n");
      out.write("            \"</tr>\" +\n");
      out.write("            \"</thead><tbody id ='MatchPointsTableBody'></tbody></table></div>\"\n");
      out.write("        GamePlanPortionBody.innerHTML=div.innerHTML\n");
      out.write("        for (let i = 0; i < listOfTeams.length; i++) {\n");
      out.write("            let div1=document.createElement(\"TR\")\n");
      out.write("            div1.innerHTML= \"<th>\"+(i+1)+\"</th>\" +\n");
      out.write("                \"<td>\"+listOfTeams[i].name+\"</td>\" +\n");
      out.write("                \"<td>\"+listOfTeams[i].mp+\"</td>\" +\"<td>\"+listOfTeams[i].win+\"</td>\" +\"<td>\"+listOfTeams[i].draw+\n");
      out.write("                \"</td>\" +\"<td>\"+listOfTeams[i].lost+\"</td>\" +\"<td>\"+listOfTeams[i].pts+\"</td>\"\n");
      out.write("            document.getElementById(\"MatchPointsTableBody\").appendChild(div1);\n");
      out.write("        }\n");
      out.write("    }\n");
      out.write("</script>");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          try { out.clearBuffer(); } catch (java.io.IOException e) {}
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
