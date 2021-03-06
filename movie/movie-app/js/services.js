/**
 * Created by Sandeep on 01/06/14.
 */

angular.module('movieApp.services',[]).factory('Movie',function($resource){
    return $resource('http://192.168.1.100:8092/movie-app-rest/api/movies/:id',{id:'@_id'},{
        // get:{
        //   method:'GET'
        // },
        // query:{
        //   method:'GET'
        // },
        // save:{
        //     method:'POST'
        // },
        // delete:{
        //   method:'DELETE'
        // },
        update: {
            method: 'PUT'
        }
    });
}).service('popupService',function($window){
    this.showPopup=function(message){
        return $window.confirm(message);
    }
});
