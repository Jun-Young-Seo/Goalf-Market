function check_upload(){
    var uploadForm = document.getElementById("add_product_form");
    var category = document.getElementById("product_category");
    var productId= document.getElementById("product_id");
    var name = document.getElementById("name");
    var price = document.getElementById("price");
    var brand = document.getElementById("brand");
    var releaseDate = document.getElementById("releaseDate");
    var stock = document.getElementById("howMany");
    //공이면 로스트볼 여부
    var isLosted = document.getElementById("isLosted");
    //클럽이면 중고 여부
    var isUsed = document.getElementById("isUsed");
    //공인지 먼저 판단
    var isBall = true;
    if(category.value==="0"){
        isBall=false;
    }
    console.log("check js file started");
    console.log(isBall)
    //공이라면 B_로 id 시작
    //채라면 C_로 id 시작
    if(isBall){
        if(!productId){
            alert("ID를 등록하세요.");
            //여기는 포커스 추가하면 에러 -> null이라서
            return false;
        }
        if(!productId.value.startsWith("B_")){
            alert("공의 ID는 B_로 시작해야 합니다.");
            productId.focus();
            return false;
        }
    }
    //채의 경우
    else if(!isBall){
        if(!productId){
            alert("ID를 등록하세요.");
            //여기는 포커스 추가하면 에러 -> null이라서
            return false;
        }
        if(!productId.value.startsWith("C_")){
            alert("채의 ID는 C_로 시작해야 합니다.");
            productId.focus();
            return false;
        }
    }

    if(!name||name.value.trim()===""){
        alert("물품 이름을 확인하세요.");
        name.focus();
        return false;
    }
    if(!brand||brand.value.trim()===""){
        alert("브랜드를 확인하세요.");
        brand.focus();
        return false;
    }
    if(!price||price.value.trim()===""||isNaN(price.value)||price.value<=0){
        alert("가격을 확인하세요.");
        price.focus();
        return false;
    }
    if(!releaseDate||releaseDate.value.trim()===""){
        alert("출시일을 확인하세요.");
        releaseDate.focus();
        return false;
    }
    if(!stock||stock.value.trim()===""){
        alert("재고 수를 확인하세요.");
        stock.focus();
        return false;
    }
    alert("등록되었습니다.");
    return true;
}