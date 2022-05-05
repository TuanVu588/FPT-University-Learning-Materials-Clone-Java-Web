const mainContainer = document.getElementById("main-container");

const avatar = document.getElementById("avatar");
const fullName = document.getElementById("full-name");
const email = document.getElementById("email");
const role = document.getElementById("role");
const eduLevel = document.getElementById("edu-level");
const userInfo = document.getElementById("user-info");
const signInBlock = document.getElementById("sign-in");

function validateEmail(mail) {
    const index = mail.indexOf("@");
    if (mail.slice(index, mail.length) === "@fpt.edu.vn") {
        return true;
    }
    alert("You have entered an invalid email address!");
    return false;
}
//Google login

async function onSignIn(googleUser) {
    const profile = await googleUser.getBasicProfile();

    if (validateEmail(profile.getEmail())) {
        if (googleUser) {
            userInfo.style.display = "flex";
            avatar.setAttribute("src", `${profile.getImageUrl()}`);
            fullName.innerHTML = `Name: ${profile.getName()}`;
            email.innerHTML = `Email: ${profile.getEmail()}`;
            role.innerHTML = `Role: ${
                    profile.getEmail() === "hoahvhe140875@fpt.edu.vn"
                    ? "Teacher"
                    : "Student"
                    }`;
            eduLevel.innerHTML = "Education Level: FU";
        }
        signInBlock.remove();
    } else {
        window.location.replace("http://localhost:8080/PRJ301.SES/");
        signOut();
    }
}

function signOut() {
    var auth2 = gapi.auth2.getAuthInstance();
    auth2.signOut().then(function () {
        window.location.replace("http://localhost:8080/PRJ301.SES");
        console.log("User signed out.");
    });
    avatar.setAttribute("src", "/assets/img/avatar_default.png");
    userInfo.style.display = "none";
}

// add active class in selected list item
const list = document.getElementsByClassName("nav-elements");
console.log(list);
for (let i = 0; i < list.length; i++) {
    list[i].onclick = () => {
        let j = 0;
        while (j < list.length) {
            list[j++].className = "nav-elements";
        }
        list[i].className = "nav-elements active";
    };
}

const infoListing = document.getElementById("info-listing");
avatar.onclick = () => {
    if (infoListing.style.display === "none") {
        infoListing.style.display = "block";
    } else {
        infoListing.style.display = "none";
    }
};
