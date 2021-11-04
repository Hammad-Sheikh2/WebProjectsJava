import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.*;

import static java.lang.Integer.parseInt;


public class RequestHandler extends HttpServlet {
    // These are the data containers used to store Application data. In programming world called Variables.
    List<Team> teams=new ArrayList<>();
    List<Match> matches=new ArrayList<>();
    List<Match> semifinals=new ArrayList<>();
    Match finalMatch;
    int matchesResultCounter=0;
    int semiFinalMatchCunts=0;
    //This method receive All Post Requests, Handle it and send Response back to index.jsp.
    public void doPost(HttpServletRequest request, HttpServletResponse response){
        //This line of code set the type of response. We can use two type 1-JSP Pages 2-Json
        //We use Json.
        // I told you why I not Use JSP because of link refreshing and losing temporarily saved data.
        response.setContentType("application/json");
        //request.getParameter(Any Attribute Name which you send from Jsp Page in data block); this code
        // will get you the value of that attribute.
        String action=request.getParameter("action");
        try {
            switch (action) {
                case "SaveNames":
                    //This code only Get the Teams Names which was sent from servlet and add new objects
                    //of class Team to the list of teams and initialize the Preliminary Rounds Matches.
                    teams.clear();
                    matches.clear();
                    semifinals.clear();
                    teams.add(new Team(request.getParameter("team1"),"Images/team1.png"));
                    teams.add(new Team(request.getParameter("team2"),"Images/team2.png"));
                    teams.add(new Team(request.getParameter("team3"),"Images/team3.png"));
                    teams.add(new Team(request.getParameter("team4"),"Images/team4.png"));
                    teams.add(new Team(request.getParameter("team5"),"Images/team5.png"));
                    teams.add(new Team(request.getParameter("team6"),"Images/team6.png"));
                    InitializeMatches();
                    response.getWriter().println(GamePlanInString());
                    break;
                case "AddMatchResult":
                    //This code get Data data from the function named addMatchResultClicked() in the index.jsp
                    //And Update that match data in the list of matches, update that team data according
                    // to rules i.e winning team get 3 points etc. and check is all Preliminary Rounds Matches Rounds
                    // are Played. If played then top 4 teams will be selected for semi finals. Same for Semi Finals
                    // if All Rounds of Semi Final Played then Top 2 Teams will selected for Final.
                    Match temp;
                    String list=request.getParameter("match");
                    if(list.equals("match")){
                        temp=matches.get(parseInt(request.getParameter("index")));
                    }
                    else if(list.equals("semiFinals")) {
                        temp=semifinals.get(parseInt(request.getParameter("index")));
                    }
                    else {
                        temp=finalMatch;
                    }
                    temp.team1Goals=parseInt(request.getParameter("team1Goals"));
                    temp.team2Goals=parseInt(request.getParameter("team2Goals"));
                    temp.isMatchPlayed=true;
                    if(temp.team1Goals>temp.team2Goals){
                        temp.isTeam1Win=1;
                    }
                    else if(temp.team1Goals== temp.team2Goals){
                        temp.isTeam1Win=0;
                    }
                    else {
                        temp.isTeam1Win=-1;
                    }
                    for (int i = 0; i < teams.size(); i++) {

                        if(teams.get(i).Name.equals(temp.team1.Name)){
                            Team team=teams.get(i);
                            team.MP++;
                            team.goalsPoints=temp.team1Goals- temp.team2Goals;
                            if(temp.team1Goals>temp.team2Goals){
                                team.Pts=team.Pts+3;
                                team.W++;
                                teams.set(i,team);
                            }
                            else if(temp.team1Goals== temp.team2Goals){
                                team.Pts=team.Pts+1;
                                team.D++;
                                teams.set(i,team);
                            }
                            else {
                                team.L++;
                                teams.set(i,team);
                            }

                        }
                        if(teams.get(i).Name.equals(temp.team2.Name)){
                            Team team=teams.get(i);
                            team.MP++;
                            team.goalsPoints=temp.team2Goals- temp.team1Goals;
                            if(temp.team1Goals>temp.team2Goals){
                                team.L++;
                                teams.set(i,team);
                            }
                            else if(temp.team1Goals== temp.team2Goals){
                                team.Pts=team.Pts+1;
                                team.D++;
                                teams.set(i,team);
                            }
                            else {
                                team.Pts=team.Pts+3;
                                team.W++;
                                teams.set(i,team);
                            }
                        }
                    }
                    if(list.equals("match")){
                        matches.set(parseInt(request.getParameter("index")),temp);
                        //From Here to line 138 check is all Preliminary Rounds Matches Rounds
                        //are Played. If played then top 4 teams will be selected for semi finals. Same for Semi Finals
                        //if All Rounds of Semi Final Played then Top 2 Teams will selected for Final.
                        matchesResultCounter++;
                        if(matchesResultCounter==6){
                            sortTeamsAccordingToPTS();
                            Match m1 = new Match(teams.get(0),teams.get(1));
                            Match m2 = new Match(teams.get(2),teams.get(3));
                            semifinals.add(m1);
                            semifinals.add(m2);
                        }
                    }
                    else if(list.equals("semiFinals")){
                        semifinals.set(parseInt(request.getParameter("index")),temp);
                        semiFinalMatchCunts++;
                        if(semiFinalMatchCunts==2){
                            sortTeamsAccordingToPTS();
                            finalMatch = new Match(teams.get(0),teams.get(1));
                        }
                    }
                    else {
                        finalMatch=temp;
                    }
                    response.getWriter().println(GamePlanInString());
                    break;
                case "EditMatchResult":
                    //This code part only edit the Previous Match Data
                    //Here I tell with an example if you enter by mistake 3-0 it means team 1 wins and 3 pts assigned to it.
                    //Now you edit it to 3-4 it means team 1 lose according to rule loser will get 0 point
                    //So 3 points will be deducted from previously assigned points to make as a result 0.
                    list=request.getParameter("match");
                    if(list.equals("match")){
                        temp=matches.get(parseInt(request.getParameter("index")));
                    }
                    else if(list.equals("semiFinals")) {
                        temp=semifinals.get(parseInt(request.getParameter("index")));
                    }
                    else {
                        temp=finalMatch;
                    }
                    int team1Goals=parseInt(request.getParameter("team1Goals"));
                    int team2Goals=parseInt(request.getParameter("team2Goals"));
                    for (int i = 0; i < teams.size(); i++) {
                        if(teams.get(i).Name.equals(temp.team1.Name)){
                            Team team=teams.get(i);
                            team.goalsPoints=team1Goals-team2Goals;
                            if(team1Goals>team2Goals){
                                if(temp.team1Goals== temp.team2Goals){
                                    team.Pts=team.Pts+2;
                                    team.D--;
                                    team.W++;
                                    teams.set(i,team);
                                }
                                if(temp.team1Goals<temp.team2Goals) {
                                    team.L--;
                                    team.W++;
                                    team.Pts=team.Pts+3;
                                    teams.set(i,team);
                                }
                            }
                            else if(team1Goals==team2Goals){
                                if(temp.team1Goals>temp.team2Goals){
                                    team.Pts=team.Pts-2;
                                    team.W--;
                                    team.D++;
                                    teams.set(i,team);
                                }
                                else if(temp.team1Goals<temp.team2Goals) {
                                    team.L--;
                                    team.Pts=team.Pts+1;
                                    team.D++;
                                    teams.set(i,team);
                                }
                            }
                            else {
                                if(temp.team1Goals>temp.team2Goals){
                                    team.Pts=team.Pts-3;
                                    team.W--;
                                    team.L++;
                                    teams.set(i,team);
                                }
                                else if(temp.team1Goals==temp.team2Goals) {
                                    team.D--;
                                    team.Pts=team.Pts-1;
                                    team.L++;
                                    teams.set(i,team);
                                }
                            }

                        }
                        if(teams.get(i).Name.equals(temp.team2.Name)){
                            Team team=teams.get(i);
                            team.goalsPoints=team2Goals-team1Goals;
                            if(team1Goals>team2Goals){
                                if(temp.team1Goals== temp.team2Goals){
                                    team.Pts=team.Pts-1;
                                    team.D--;
                                    team.L++;
                                    teams.set(i,team);
                                }
                                if(temp.team1Goals<temp.team2Goals) {
                                    team.L++;
                                    team.W--;
                                    team.Pts=team.Pts-3;
                                    teams.set(i,team);
                                }
                            }
                            else if(team1Goals==team2Goals){
                                if(temp.team1Goals>temp.team2Goals){
                                    team.L--;
                                    team.Pts=team.Pts+1;
                                    team.D++;
                                    teams.set(i,team);
                                }
                                else if(temp.team1Goals<temp.team2Goals) {
                                    team.Pts=team.Pts-2;
                                    team.W--;
                                    team.D++;
                                    teams.set(i,team);
                                }
                            }
                            else {
                                if(temp.team1Goals>temp.team2Goals){
                                    team.Pts=team.Pts+3;
                                    team.W++;
                                    team.L--;
                                    teams.set(i,team);
                                }
                                else if(temp.team1Goals==temp.team2Goals) {
                                    team.D--;
                                    team.Pts=team.Pts+2;
                                    team.W++;
                                    teams.set(i,team);
                                }
                            }
                        }
                    }
                    temp.team1Goals=team1Goals;
                    temp.team2Goals=team2Goals;
                    if(temp.team1Goals>temp.team2Goals){
                        temp.isTeam1Win=1;
                    }
                    else if(temp.team1Goals== temp.team2Goals){
                        temp.isTeam1Win=0;
                    }
                    else {
                        temp.isTeam1Win=-1;
                    }
                    if(list.equals("match")){
                        matches.set(parseInt(request.getParameter("index")),temp);
                    }
                    else if(list.equals("semiFinals")){
                        semifinals.set(parseInt(request.getParameter("index")),temp);
                    }
                    else {
                        finalMatch=temp;
                    }
                    response.getWriter().println(GamePlanInString());
                    break;
            }
        }
        catch (Exception e){

        }
    }
    void InitializeMatches(){
        List<Team> GroupA=new ArrayList<>();
        List<Team> GroupB=new ArrayList<>();
        int y=0;
        for (int i = 0; i < 3; i++) {
            int random=new Random().nextInt(teams.size()-y);
            GroupA.add(teams.get(random));
            mySwap(random,teams.size()-y-1);
            y++;
            random=new Random().nextInt(teams.size()-y);
            GroupB.add(teams.get(random));
            mySwap(random,teams.size()-y-1);
            y++;
        }
        matches.add(new Match(GroupA.get(0),GroupA.get(1)));
        matches.add(new Match(GroupB.get(0),GroupB.get(1)));
        matches.add(new Match(GroupA.get(0),GroupA.get(2)));
        matches.add(new Match(GroupB.get(0),GroupB.get(2)));
        matches.add(new Match(GroupA.get(1),GroupA.get(2)));
        matches.add(new Match(GroupB.get(1),GroupB.get(2)));
    }
    void mySwap(int a,int b){
        //This code only only swap position of the team in list {list is array we use to store teams}.
        Team temp=teams.get(a);
        teams.set(a,teams.get(b));
        teams.set(b,temp);
    }
    void sortTeamsAccordingToPTS(){
        for (int i = 0; i < teams.size()-1; i++) {
            for (int j = i+1; j < teams.size(); j++) {
                if(teams.get(i).Pts<=teams.get(j).Pts){
                    if(teams.get(i).Pts==teams.get(j).Pts){
                        if(teams.get(i).goalsPoints<=teams.get(j).goalsPoints){
                            mySwap(i,j);
                        }
                    }
                    else{
                        mySwap(i,j);
                    }
                }
            }
        }
    }
    String GamePlanInString(){
        //Sorting First Teams According to PTS
        sortTeamsAccordingToPTS();
        //Convert Data to String but in Json Format Array.
        String result="{\"status\":true";
        result+=",\"listOfTeams\":[";
        for(int i=0;i<teams.size();i++){
            result+="{\"name\":\""+teams.get(i).Name+"\"" +
                    ",\"win\":"+teams.get(i).W+"" +
                    ",\"lost\":"+teams.get(i).L+"" +
                    ",\"draw\":"+teams.get(i).D+"" +
                    ",\"pts\":"+teams.get(i).Pts+"" +
                    ",\"mp\":"+teams.get(i).MP+"" +
                    ",\"img\":\""+teams.get(i).Logo+"\"" +
                    (i+1==teams.size()?"}":"},");
        }
        result+="],\"listOfMatches\":[";
        for(int i=0;i<matches.size();i++){
            result+="{\"team1\":" +
                    "{\"name\":\""+matches.get(i).team1.Name+"\"" +
                    ",\"win\":"+matches.get(i).team1.W+"" +
                    ",\"lost\":"+matches.get(i).team1.L+"" +
                    ",\"draw\":"+matches.get(i).team1.D+"" +
                    ",\"pts\":"+matches.get(i).team1.Pts+"" +
                    ",\"mp\":"+matches.get(i).team1.MP+"" +
                    ",\"img\":\""+matches.get(i).team1.Logo+"\"}" +
                    ",\"team2\":" +
                    "{\"name\":\""+matches.get(i).team2.Name+"\"" +
                    ",\"win\":"+matches.get(i).team2.W+"" +
                    ",\"lost\":"+matches.get(i).team2.L+"" +
                    ",\"draw\":"+matches.get(i).team2.D+"" +
                    ",\"pts\":"+matches.get(i).team2.Pts+"" +
                    ",\"mp\":"+matches.get(i).team2.MP+"" +
                    ",\"img\":\""+matches.get(i).team2.Logo+"\"}" +
                    ",\"team1Goals\":"+matches.get(i).team1Goals+"" +
                    ",\"team2Goals\":"+matches.get(i).team2Goals+"" +
                    ",\"isMatchPlayed\":"+matches.get(i).isMatchPlayed+"" +
                    ",\"isFirstTeamWin\":"+matches.get(i).isTeam1Win+""+
                    (i+1==matches.size()?"}":"},");
        }
        result+="]";
        if(semifinals.size()!=0){
            result+=",\"listOfSemiFinals\":[";
            for(int i=0;i<semifinals.size();i++){
                result+="{\"team1\":" +
                        "{\"name\":\""+semifinals.get(i).team1.Name+"\"" +
                        ",\"win\":"+semifinals.get(i).team1.W+"" +
                        ",\"lost\":"+semifinals.get(i).team1.L+"" +
                        ",\"draw\":"+semifinals.get(i).team1.D+"" +
                        ",\"pts\":"+semifinals.get(i).team1.Pts+"" +
                        ",\"mp\":"+semifinals.get(i).team1.MP+"" +
                        ",\"img\":\""+semifinals.get(i).team1.Logo+"\"}" +
                        ",\"team2\":" +
                        "{\"name\":\""+semifinals.get(i).team2.Name+"\"" +
                        ",\"win\":"+semifinals.get(i).team2.W+"" +
                        ",\"lost\":"+semifinals.get(i).team2.L+"" +
                        ",\"draw\":"+semifinals.get(i).team2.D+"" +
                        ",\"pts\":"+semifinals.get(i).team2.Pts+"" +
                        ",\"mp\":"+semifinals.get(i).team2.MP+"" +
                        ",\"img\":\""+semifinals.get(i).team2.Logo+"\"}" +
                        ",\"team1Goals\":"+semifinals.get(i).team1Goals+"" +
                        ",\"team2Goals\":"+semifinals.get(i).team2Goals+"" +
                        ",\"isMatchPlayed\":"+semifinals.get(i).isMatchPlayed+"" +
                        ",\"isFirstTeamWin\":"+semifinals.get(i).isTeam1Win+""+
                        (i+1==semifinals.size()?"}":"},");
            }
            result+="]";
        }
        else {
            result+=",\"listOfSemiFinals\":false";
        }
        if(finalMatch!=null){
            result+=",\"finalMatch\":{";
            result+="\"team1\":" +
                    "{\"name\":\""+finalMatch.team1.Name+"\"" +
                    ",\"win\":"+finalMatch.team1.W+"" +
                    ",\"lost\":"+finalMatch.team1.L+"" +
                    ",\"draw\":"+finalMatch.team1.D+"" +
                    ",\"pts\":"+finalMatch.team1.Pts+"" +
                    ",\"mp\":"+finalMatch.team1.MP+"" +
                    ",\"img\":\""+finalMatch.team1.Logo+"\"}" +
                    ",\"team2\":" +
                    "{\"name\":\""+finalMatch.team2.Name+"\"" +
                    ",\"win\":"+finalMatch.team2.W+"" +
                    ",\"lost\":"+finalMatch.team2.L+"" +
                    ",\"draw\":"+finalMatch.team2.D+"" +
                    ",\"pts\":"+finalMatch.team2.Pts+"" +
                    ",\"mp\":"+finalMatch.team2.MP+"" +
                    ",\"img\":\""+finalMatch.team2.Logo+"\"}" +
                    ",\"team1Goals\":"+finalMatch.team1Goals+"" +
                    ",\"team2Goals\":"+finalMatch.team2Goals+"" +
                    ",\"isMatchPlayed\":"+finalMatch.isMatchPlayed+"" +
                    ",\"isFirstTeamWin\":"+finalMatch.isTeam1Win+"}";
        }
        else {
            result+=",\"finalMatch\":false";
        }
        result+="}";
        return result;
    }
}
