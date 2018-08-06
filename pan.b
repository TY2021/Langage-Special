	switch (t->back) {
	default: Uerror("bad return move");
	case  0: goto R999; /* nothing to undo */

		 /* PROC :init: */
;
		;
		
	case 4: // STATE 2
		;
		;
		delproc(0, now._nr_pr-1);
		;
		goto R999;

	case 5: // STATE 3
		;
		((P1 *)this)->proc = trpt->bup.oval;
		;
		goto R999;

	case 6: // STATE 4
		;
	/* 0 */	((P1 *)this)->proc = trpt->bup.oval;
		;
		;
		goto R999;

	case 7: // STATE 9
		;
		p_restor(II);
		;
		;
		goto R999;

		 /* PROC philosopher */

	case 8: // STATE 10
		;
		((P0 *)this)->state = trpt->bup.ovals[2];
		now.fork[ Index(((P0 *)this)->left, 5) ] = trpt->bup.ovals[1];
		now.fork[ Index(((P0 *)this)->right, 5) ] = trpt->bup.ovals[0];
		;
		ungrab_ints(trpt->bup.ovals, 4);
		goto R999;

	case 9: // STATE 10
		;
		((P0 *)this)->state = trpt->bup.ovals[0];
		;
		ungrab_ints(trpt->bup.ovals, 2);
		goto R999;

	case 10: // STATE 10
		;
		((P0 *)this)->state = trpt->bup.ovals[2];
		now.fork[ Index(((P0 *)this)->right, 5) ] = trpt->bup.ovals[1];
		now.fork[ Index(((P0 *)this)->left, 5) ] = trpt->bup.ovals[0];
		;
		ungrab_ints(trpt->bup.ovals, 4);
		goto R999;

	case 11: // STATE 12
		;
		now.fork[ Index(((P0 *)this)->left, 5) ] = trpt->bup.oval;
		;
		goto R999;

	case 12: // STATE 13
		;
		now.fork[ Index(((P0 *)this)->right, 5) ] = trpt->bup.oval;
		;
		goto R999;

	case 13: // STATE 14
		;
		((P0 *)this)->state = trpt->bup.ovals[0];
		;
		ungrab_ints(trpt->bup.ovals, 2);
		goto R999;

	case 14: // STATE 18
		;
		p_restor(II);
		;
		;
		goto R999;
	}

