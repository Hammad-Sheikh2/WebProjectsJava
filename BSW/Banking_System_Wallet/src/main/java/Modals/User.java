package Modals;

import org.sql.Modals.UsersEntity;

public class User {
    public int user_id;
    public String user_name;
    public String user_email;
    public String user_national_id;
    public String user_contact;
    public String user_password;
    public String user_address;

    public User() {
    }
    public User(UsersEntity usersEntity){
        user_id=usersEntity.getUserId();
        user_name=usersEntity.getUserName();
        user_email=usersEntity.getUserEmail();
        user_national_id=usersEntity.getUserNationalId();
        user_contact=usersEntity.getUserContact();
        user_password=usersEntity.getUserPassword();
        user_address=usersEntity.getUserAddress();
    }
    public int getUser_id() {
        return user_id;
    }

    public String getUser_address() {
        return user_address;
    }

    public String getUser_contact() {
        return user_contact;
    }

    public String getUser_email() {
        return user_email;
    }

    public String getUser_name() {
        return user_name;
    }

    public String getUser_national_id() {
        return user_national_id;
    }

    public String getUser_password() {
        return user_password;
    }
}
