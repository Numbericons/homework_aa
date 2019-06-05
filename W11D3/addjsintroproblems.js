function titleize(arr_names, printNames) {
    // let titleized_names = arr_names.map(name => `Mx. ${name} Jingleheimer Schmidt`);
    let titleized_names = arr_names.map(name => name.charAt(0).toUpperCase() + name.slice(1));
    printNames(titleized_names);
}

// const printNames = function(arr_names) {
//     arr_names.prototype.forEach(function(name) {
//         console.log(name);
//     });
// }

titleize(["Mary", "Brian", "Leo"], (names) => {
    names.forEach(name => console.log(name));
}); 
