package Bean;

public class mysqlbean  implements java.io.Serializable
{
    private String user = "2";
    private String password = "";
    private String host ="sql12.freemysqlhosting.net:3306";

    public mysqlbean(){}

    public String getUser() {
        return user;
    }

    public String getPassword() {
        return password;
    }

    public String getHost() {
        return host;
    }
}