/**
 * 
 */

ClassicEditor 

.create( document.querySelector( '#smartEditor' ) ) 

.then( editor => { 

    console.log( editor ); 

} ) 

.catch( error => { 

    console.error( error ); 

} );