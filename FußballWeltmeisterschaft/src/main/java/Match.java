//This is Match Class
public class Match {
    //This is Match Class Data Members
    public Team team1,team2;
    public int team1Goals=0,team2Goals=0;
    public boolean isMatchPlayed;
    public int isTeam1Win;
    public Match(Team t1,Team t2){
        team1=t1;
        team2=t2;
        team1Goals=0;
        team2Goals=0;
        isTeam1Win=0;
        isMatchPlayed=false;
    }
}
