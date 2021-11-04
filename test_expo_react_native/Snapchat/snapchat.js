import React from "react"
import {View,Text,StyleSheet,RefreshControl,ScrollView,Image} from 'react-native'
import {useDeviceOrientation} from "@react-native-community/hooks"
import {} from "react-native-web";
import {setStatusBarBackgroundColor} from "expo-status-bar";
const STYLES = ['default', 'dark-content', 'light-content'];
const TRANSITIONS = ['fade', 'slide', 'none'];

export default function Snapchat(){
    setStatusBarBackgroundColor('lightgray');
    const [refreshing, setRefreshing] = React.useState(false);

    const onRefresh = React.useCallback(() => {
        setRefreshing(true);
        setTimeout(() => setRefreshing(false),2000);
    }, []);
    return(
        <View style={styles.container}>
            <View style={[styles.navbar,styles.upperSection,{justifyContent: 'space-between',paddingTop:5}]}>
                <View style={styles.navbar}>
                    <View style={[{marginLeft:10,width:30,height:30,borderRadius:50,backgroundColor:'darkgray',alignItems:'center',justifyContent:'center'}]}>
                        <Image style={[{height: 20,width:20}]} source={require("../assets/Images/profile.png")}></Image>
                    </View>
                    <View style={[{marginLeft:10,width:30,height:30,borderRadius:50,backgroundColor:'darkgray',alignItems:'center',justifyContent:'center'}]}>
                        <Image style={[{height: 20,width:20}]} source={require("../assets/Images/search.png")}></Image>
                    </View>
                </View>
                <View style={styles.navbar} >
                    <View style={[{marginRight:10,width:30,height:30,borderRadius:50,backgroundColor:'darkgray',alignItems:'center',justifyContent:'center'}]}>
                        <Image style={[{height: 20,width:20}]} source={require("../assets/Images/options.png")}></Image>
                    </View>
                </View>
            </View>
            <View style={[styles.innerSection]}>
                <ScrollView
                    refreshControl={
                        <RefreshControl
                            refreshing={refreshing}
                            onRefresh={onRefresh}
                        />
                    }
                >
                    {data.map((item=>{
                        return(
                            <View style={[styles.item,styles.navbar,{justifyContent: 'space-between',alignItems: 'center'}]}>
                                <View style={styles.navbar}>
                                    <Image style={[{marginLeft:10,height: 50,width:50}]} source={require("../assets/Images/user.png")}></Image>
                                    <View>
                                        <Text style={[styles.title]}>{item.name}</Text>
                                        <Text style={[styles.subTitle]}>
                                            <Image style={[{height: 12,width:12}]} source={require("../assets/Images/delivered.png")}></Image>
                                            Delivered    4min ago     {item.streak}
                                            <Image style={[{height: 12,width:12}]} source={require("../assets/Images/streak.png")}></Image>
                                        </Text>
                                    </View>
                                </View>
                                <View style={[styles.navbar,{alignItems: 'center'}]}>
                                    <View style={[{backgroundColor:'#a9a9a9',height: 50,width:1}]}></View>
                                    <Image style={[{marginLeft:20,marginRight:10,height: 20,width:20}]} source={require("../assets/Images/chat.png")}></Image>
                                </View>

                            </View>
                        )
                    }))}
                </ScrollView>
            </View>
            <View style={[styles.navbar,styles.bottomSection,{justifyContent: 'space-around'}]}>
                <Image style={[{height: 30,width:30}]} source={require("../assets/Images/location.png")}></Image>
                <Image style={[{height: 30,width:30}]} source={require("../assets/Images/chat1.png")}></Image>
                <Image style={[{height: 30,width:30}]} source={require("../assets/Images/camera.png")}></Image>
                <Image style={[{height: 30,width:30}]} source={require("../assets/Images/friends.png")}></Image>
                <Image style={[{height: 30,width:30}]} source={require("../assets/Images/settings.png")}></Image>
            </View>
        </View>
    )
};
const styles=StyleSheet.create({
    container:{
        flex:1,
        backgroundColor:'black'
    },
    navbar:{
        flexDirection:'row'
    },
    justifyContentCenter:{
        justifyContent:'center'
    },
    navbarAlignRight:{
      alignContent: 'flex-end'
    },
    alignSelfCenter:{
        alignSelf:'center'
    },
    upperSection:{
        backgroundColor: 'white',
        flex: 1,
        alignItems:'center'
    },
    innerSection:{
        backgroundColor: 'white',
        flex: 10,
        borderBottomLeftRadius:20,
        borderBottomRightRadius:20,
    },
    bottomSection:{
        flex: 1,
    },
    item:{
        height:70,
    },
    title:{
        fontSize:18,
        fontWeight:'bold'
    },
    subTitle:{
        fontSize: 10,
        color:'#a9a9a9'
    }
});
let data=[
    {name:"Hammad Sheikh",streak:325},
    {name:"Maddy",streak:15},
    {name:"Osama Butt",streak:70},
    {name:"Usman CS",streak:298},
    {name:"Usama Aziz",streak:0},
    {name:"Hammad Sheikh",streak:325},
    {name:"Hammad Sheikh",streak:325},
    {name:"Hammad Sheikh",streak:325},
    {name:"Hammad Sheikh",streak:325},
    {name:"Hammad Sheikh",streak:325},
    {name:"Hammad Sheikh",streak:325},
    {name:"Hammad Sheikh",streak:325},
    {name:"Hammad Sheikh",streak:325},
    {name:"Hammad Sheikh",streak:325},
    {name:"Hammad Sheikh",streak:325},
    {name:"Hammad Sheikh",streak:325},
    {name:"Hammad Sheikh",streak:325},
    {name:"Hammad Sheikh",streak:325},
    {name:"Hammad Sheikh",streak:325},
    {name:"Hammad Sheikh",streak:325},
    {name:"Hammad Sheikh",streak:325},
    {name:"Hammad Sheikh",streak:325},
    {name:"Hammad Sheikh",streak:325},
    {name:"Hammad Sheikh",streak:325},
    {name:"Hammad Sheikh",streak:325},
    {name:"Hammad Sheikh",streak:325},
    {name:"Hammad Sheikh",streak:325},
    {name:"Hammad Sheikh",streak:325},
    {name:"Hammad Sheikh",streak:325},
    {name:"Hammad Sheikh",streak:325},
    {name:"Hammad Sheikh",streak:325},
    {name:"Hammad Sheikh",streak:325},
    {name:"Hammad Sheikh",streak:325},
    {name:"Hammad Sheikh",streak:325},
    {name:"Hammad Sheikh",streak:325},
    {name:"Hammad Sheikh",streak:325},
]

