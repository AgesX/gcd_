//
//  main.cpp
//  aaaaaa
//
//  Created by Jz D on 2021/8/10.
//

#include <iostream>
#include <string>
#include <unordered_map>

using namespace std;



// 给一个字符串， 算出两个相同字符，之间的最远距离


int maxLengthBetweenEqualCharacters(string s) {
    unordered_map<char, int> container;
    int cnt = (int)s.length();
    if (cnt < 2){
        return -1;
    }
    int result = -1;
    for (int i = 0; i < cnt; i ++) {
        if (container.find(s[i]) == container.end()){
            container[s[i]] = i;
        }
        else{
            result = max(result, i - container[s[i]] - 1);
        }
    }
    return result;
}


int main(int argc, const char * argv[]) {
    
    
    
    
    cout << maxLengthBetweenEqualCharacters("aaa") << endl;
    
    
    
    
    
    
    return 0;
}



int maxLengthBetweenEqualCharacters___(string s) {
    
    unordered_map<char, int> container;
    
    int cnt = (int)s.length();
    
    
    
    if (cnt < 2){
        return -1;
    }
    int result = -1;
    
    for (int i = 0; i < cnt; i ++) {
        // cout << s[i] << endl;
        if (container.find(s[i]) == container.end()){
            container[s[i]] = i;
        }
        else{
            result = max(result, i - container[s[i]]);
        }
        
        
    }
//    for (auto cake: container){
//        cout << cake.first << cake.second << endl;
//
//    }
//
    
    return result;
}



// 银行面试

// 强调 OC ， @synthesize ,  多 webview 和 http client 的数据共享，  内存管理冲突， strong , copy , retain
