import React ,{useState}  from 'react';
import Practice from "./Practice";
import {
    StyleSheet,
    Text, View, Image,
    SafeAreaView, StatusBar,Platform,
    TextInput,Button,ScrollView,FlatList} from 'react-native';
import Snapchat from "./Snapchat/snapchat";

export default function App() {
  let[menu,setMenu]=useState("Snapchat");
  return (
      <SafeAreaView style={styles.container}>
          {menu==="Home"?<Practice></Practice>:<View></View>}
          {menu==="Snapchat"?<Snapchat></Snapchat>:<View></View>}
      </SafeAreaView>
  );
}

const styles = StyleSheet.create({
    container: {
        paddingTop: Platform.OS==="android"? StatusBar.currentHeight:0,
        flex: 1,
        backgroundColor: '#fff',
    }
});
