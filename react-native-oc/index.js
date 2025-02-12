import React from 'react';
import {AppRegistry, 
  StyleSheet, 
  Text, 
  View,
  Button,
  Alert,
NativeModules} from 'react-native';

const RNHighScores = ({scores}) => {
  const contents = scores.map(score => (
    <Text key={score.name}>
      {score.name}:{score.value}
      {'\n'}
    </Text>
  ));
  return (
    <View style={styles.container}>
      <Text style={styles.highScoresTitle}>
        2048 High Scores!
      </Text>

      <Text style={styles.scores}>{contents}</Text> 
      
      <Button title="离开React Native 页面" onPress={() => NativeModules.TestModule.quitRNview()}></Button> 

    </View>
  );
};

const styles = StyleSheet.create({
  container: {
    flex: 1,
    justifyContent: 'center',
    alignItems: 'center',
    backgroundColor: '#FFFFFF',
  },
  highScoresTitle: {
    fontSize: 20,
    textAlign: 'center',
    margin: 10,
  },
  scores: {
    textAlign: 'center',
    color: '#333333',
    marginBottom: 5,
  },
});



AppRegistry.registerComponent('RNHighScores', () => RNHighScores);