module.exports.postCreate = function(req,res,next){
    var errors=[];// array chua loi
    if(!req.body.id){ // neu k nhap vao form name, them string bao loi vao errors
        errors.push('This id of employee is required');
    }
    if(!req.body.name){// neu k nhap vao form phone, them string bao loi vao errors
        errors.push('This name of employee is required');
    }
    if(!req.body.address){// neu k nhap vao form phone, them string bao loi vao errors
        errors.push('This address of employee is required');
    }
    if(!req.body.birthday){// neu k nhap vao form phone, them string bao loi vao errors
        errors.push('This birthday of employee is required');
    }
    if(errors.length){ // neu errors.length > 0 
        res.render('employees/create', {errors: errors,values: req.body, salary:req.body.salary});// res.render 'user/create' truyen vao 2 tham so errors, values(values dung de giu lai thong tin ng dung da nhap)
        return; // return de ngat k them du lieu vao db khi co loi
    }
    next();
}