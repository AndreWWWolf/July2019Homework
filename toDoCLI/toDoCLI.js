const readline = require('readline');
const log = (x) => {
    console.log(x);
}

const rl = readline.createInterface({
    input: process.stdin,
    output: process.stdout
});

let list = [];
let clist = [];

log("Welcome to Todo CLI!");

log("--------------------------------");




let loop = function () {
    rl.question('(v) View \u25C9 (n) New \u25C9 (cX) Complete \u25C9 (dX) Delete \u25C9 (q) Quit \n >  ', (answer) => {
        //Menu Systemv
        if (answer == 'q') {
            log("See you soon! 😃")
            return rl.close();
        } else if (answer == 'n') {
            rl.question("\n What needs doing? \n > ", (n1) => {
                list.push(n1);
                clist.push('');
                log("\n ")
                loop();
            });


        } else if (answer.charAt(0) == 'c') {
            let task = list[Number(answer.charAt(1))]
            clist[Number(answer.charAt(1) + answer.charAt(2) + answer.charAt(3))] = '\u2713';
            log("\n ")
            log(`Completed "${task}" `);
            log("\n ")
        } else if (answer.charAt(0) == 'd') {
            let task = list[Number(answer.charAt(1) + answer.charAt(2) + answer.charAt(3))]
            list.splice(Number(answer.charAt(1) + answer.charAt(2) + answer.charAt(3)), 1);
            log("\n ")
            log(`Deleted "${task}" `);
            log("\n ")
        } else if (answer == 'v') {
            log("\n ")
            let count = 0;
            if (list.toString() == '') {
                log('List is empty...');
            }
            for (let val of list) {

                log(`${count} [${clist[count]}] ${val}`);
                count++;
            }
            log("\n ")
        }

        loop();
    });

};



loop();