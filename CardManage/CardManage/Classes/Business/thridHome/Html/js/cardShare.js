$(function(){

	//显示的图片数组
	var headImgArr = ["http://bj-img2017.oss-cn-beijing.aliyuncs.com/bjadmin/9/2d6ba84a480f44ccb31f89b78117551f.jpg",
					  "http://bj-img2017.oss-cn-beijing.aliyuncs.com/bjadmin/9/91511a6f996b4e9da75d4a159e9ef6fe.jpg",
					  "http://bj-img2017.oss-cn-beijing.aliyuncs.com/bjadmin/9/579e9990e95c4c55addd73c8733fe5d3.jpg",
					  "http://bj-img2017.oss-cn-beijing.aliyuncs.com/bjadmin/9/c40ae1cc2a5449ff859abb17c99c0ecf.jpg"];
	//获取滚动视图
	var leftIndex = 0;
	var rightIndex = 0;

	var mySwiper = new Swiper('.swiper-container',{
		autoplay:false,
		loop:true,
		loopAdditionalSlides : 4,
		slidesPerView:3,
		loopFillGroupWithBlank: true,
		spaceBetween:'6%',
		preventClicks:false,
		// slideToClickedSlide:true,
		on: {
			slideChangeTransitionStart:function(){
				// console.log('realIndex1  ' + this.realIndex);
			},
    		slideChangeTransitionEnd: function(){

      			recoverOpacity(this.slides);
      			var thisSlide = this.slides[this.activeIndex + 1];

      			//用于点击滑动
      			leftIndex = this.activeIndex;
      			rightIndex = this.activeIndex + 2;

      			// console.log('leftIndex  ' + leftIndex + ' rightLeft  ' + rightIndex);
      			thisSlide.style.opacity = 1;
      			// console.log('realIndex2 ' + thisSlide.getBoundingClientRect().left);  
      			var headImgIndex = this.realIndex;
      			if(headImgIndex == 3){
      				changeHeadImg(0);
      			}else {
      				changeHeadImg(this.realIndex+1);
      			}
   	 		},
   	 	    click:function(event){
   	 	    	
   	 	    	if(this.clickedIndex == leftIndex){
   	 	    		this.slidePrev();
   	 	    	} 

   	 	    	if(this.clickedIndex == rightIndex){
   	 	    		this.slideNext();
   	 	    	}
   	 	    }
	 }
	});

	function changeHeadImg(index){
		var headImg = $(".cardShare-headImage-img");
		// console.log(index);
		headImg.attr("src",headImgArr[index]);
	};

	function recoverOpacity(slides){
		for(var i = 0; i < slides.length; i++){
			slides[i].style.opacity = 0.5;
		}
	};
});