import React ,{useState} from 'react';
import {
    StyleSheet,
    Text, View, Image,
    SafeAreaView, StatusBar,Platform,
    TextInput,Button,ScrollView,FlatList} from 'react-native';
import {} from "react-native-web";
import {useDeviceOrientation} from "@react-native-community/hooks"

export default function Practice() {
    let [name,setName]=useState("");
    let[menu,setMenu]=useState("Home");
    let {landscape}=useDeviceOrientation();
    return (
        <SafeAreaView style={styles.container}>
            <ScrollView>
                <View style={[styles.navbar,{height:landscape?80:150,flexDirection:landscape?'row':'column'}]}>
                    <View style={[styles.navbar_brand,
                        {
                            flexDirection: landscape?'row':'column',
                            position:landscape?'absolute':'relative',
                            top:landscape?15:0,
                            left:landscape?5:0,
                        }]}>
                        <Image style={styles.navbar_brand_image} source={require('./assets/Images/logo.png')} />
                        <Text style={styles.navbar_brand_text}>Taste.it</Text>
                    </View>
                    <View style={styles.navbar_menu}>
                        <FlatList
                            contentContainerStyle={[styles.navbar_menu,{
                                alignSelf:landscape?'flex-end':'center',
                                paddingRight:landscape?10:0
                            }]}
                            data={[
                                {key:"Dashboard"},
                                {key:"Menu"},
                                {key:"Order"},
                                {key:"Reports"}
                            ]}
                            renderItem={({item})=> <View
                                style={{
                                    backgroundColor:"powderblue",
                                    border:1,
                                    borderRadius:30,
                                    alignItems:'center',
                                    justifyContent:'center',
                                    margin:2,
                                    width:80,
                                    height:40,
                                }}>
                                <Text
                                    style={styles.navbar_menu_buttons} onPress={()=>{setMenu(item.key);}}
                                    onLongPress={()=>{setMenu(item.key+" LONG PRESSED");
                                    }}>
                                    {item.key}
                                </Text>
                            </View>}

                        />
                    </View>
                </View>
                <Text>{menu}</Text>
            </ScrollView>
        </SafeAreaView>
    );
}

const styles = StyleSheet.create({
    container: {
        paddingTop: Platform.OS==="android"? StatusBar.currentHeight:0,
        flex: 1,
        backgroundColor: '#fff',
    },
    navbar:{
        backgroundColor: '#DC3545',
        width:'100%',
        flexDirection:'row',
        justifyContent:'center',
        alignItems: 'center'
    },
    navbar_brand:{
        flexDirection: 'row',
        alignItems:'center',
        alignContent:'flex-start',
        alignSelf:'center'
    },
    navbar_menu:{
        flexDirection: 'row',
        justifyContent: 'space-evenly',
        alignItems:'center',
        alignContent:'flex-end',
        alignSelf:'center'
    },
    navbar_brand_image:{
        width: 50,
        height: 50
    },
    navbar_brand_text:{
        color:'white',
        fontSize:20
    },
    navbar_menu_buttons:{
        padding:8,
        fontSize:15,
        color: 'red'
    },
    navbar_menu_item:{
        flexDirection: 'row',
        alignItems:'center',
        alignContent:'flex-end',
        alignSelf:'center'
    },
    item: {
        padding: 10,
        fontSize: 18,
        height: 44,
    }
});
