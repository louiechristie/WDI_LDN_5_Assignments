var musicPlayer = musicPlayer || {};

musicPlayer.workit = function() {
	var $workitButton = $('#workit');
	var workit = soundManager.createSound({
		id: 'workit',
		url: '/wavs/work it.wav'
	});

	workit.play()
};

musicPlayer.makeit = function() {
	var $makeitButton = $('#makeit');
	var makeit = soundManager.createSound({
		id: 'makeit',
		url: '/wavs/make it.wav'
	});

	makeit.play()
};

musicPlayer.doit = function() {
	var $doitButton = $('#doit');
	var doit = soundManager.createSound({
		id: 'doit',
		url: '/wavs/do it.wav'
	});

	doit.play()
};

musicPlayer.makesus = function() {
	var $makesusButton = $('#makesus');
	var makesus = soundManager.createSound({
		id: 'makesus',
		url: '/wavs/makes us.wav'
	});

	makesus.play()
};

musicPlayer.harder = function() {
	var $harderButton = $('#harder');
	var harder = soundManager.createSound({
		id: 'harder',
		url: '/wavs/harder.wav'
	});

	harder.play()
};

musicPlayer.better = function() {
	var $betterButton = $('#better');
	var better = soundManager.createSound({
		id: 'better',
		url: '/wavs/better.wav'
	});

	better.play()
};

musicPlayer.faster = function() {
	var $fasterButton = $('#faster');
	var faster = soundManager.createSound({
		id: 'faster',
		url: '/wavs/faster.wav'
	});

	faster.play()
};

musicPlayer.stronger = function() {
	var $strongerButton = $('#stronger');
	var stronger = soundManager.createSound({
		id: 'stronger',
		url: '/wavs/stronger.wav'
	});

	stronger.play()
};

musicPlayer.morethan = function() {
	var $morethanButton = $('#morethan');
	var morethan = soundManager.createSound({
		id: 'morethan',
		url: '/wavs/more than.wav'
	});

	morethan.play()
};

musicPlayer.hour = function() {
	var $hourButton = $('#hour');
	var hour = soundManager.createSound({
		id: 'hour',
		url: '/wavs/hour.wav'
	});

	hour.play()
};

musicPlayer.our = function() {
	var $ourButton = $('#our');
	var our = soundManager.createSound({
		id: 'our',
		url: '/wavs/our.wav'
	});

	our.play()
};

musicPlayer.never = function() {
	var $neverButton = $('#never');
	var never = soundManager.createSound({
		id: 'never',
		url: '/wavs/never.wav'
	});

	never.play()
};

musicPlayer.ever = function() {
	var $everButton = $('#ever');
	var ever = soundManager.createSound({
		id: 'ever',
		url: '/wavs/ever.wav'
	});

	ever.play()
};

musicPlayer.after = function() {
	var $afterButton = $('#after');
	var after = soundManager.createSound({
		id: 'after',
		url: '/wavs/after.wav'
	});

	after.play()
};

musicPlayer.workis = function() {
	var $workisButton = $('#workis');
	var workis = soundManager.createSound({
		id: 'workis',
		url: '/wavs/work is.wav'
	});

	workis.play()
};

musicPlayer.over = function() {
	var $overButton = $('#over');
	var over = soundManager.createSound({
		id: 'over',
		url: '/wavs/over.wav'
	});

	over.play()
};

musicPlayer.setup = function() {
	$('#workit').click(musicPlayer.workit);
	$('#makeit').click(musicPlayer.makeit);
	$('#doit').click(musicPlayer.doit);
	$('#makesus').click(musicPlayer.makesus);
	$('#harder').click(musicPlayer.harder);
	$('#better').click(musicPlayer.better);
	$('#faster').click(musicPlayer.faster);
	$('#stronger').click(musicPlayer.stronger);
	$('#morethan').click(musicPlayer.morethan);
	$('#hour').click(musicPlayer.hour);
	$('#our').click(musicPlayer.our);
	$('#never').click(musicPlayer.never);
	$('#ever').click(musicPlayer.ever);
	$('#after').click(musicPlayer.after);
	$('#workis').click(musicPlayer.workis);
	$('#over').click(musicPlayer.over);
};

$(document).ready(function() {
	soundManager.setup({
	url: '/swf/',
	preferFlash: true,
	onready: musicPlayer.setup
  });
});






