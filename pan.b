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

	case 8: // STATE 6
		;
		((P0 *)this)->state = trpt->bup.ovals[1];
		now.fork[ Index(((P0 *)this)->right, 5) ] = trpt->bup.ovals[0];
		;
		ungrab_ints(trpt->bup.ovals, 3);
		goto R999;

	case 9: // STATE 8
		;
		now.fork[ Index(((P0 *)this)->right, 5) ] = trpt->bup.oval;
		;
		goto R999;
;
		
	case 10: // STATE 17
		goto R999;

	case 11: // STATE 15
		;
		((P0 *)this)->state = trpt->bup.ovals[4];
		now.fork[ Index(((P0 *)this)->right, 5) ] = trpt->bup.ovals[3];
		now.fork[ Index(((P0 *)this)->left, 5) ] = trpt->bup.ovals[2];
		((P0 *)this)->state = trpt->bup.ovals[1];
		now.fork[ Index(((P0 *)this)->left, 5) ] = trpt->bup.ovals[0];
		;
		ungrab_ints(trpt->bup.ovals, 7);
		goto R999;

	case 12: // STATE 23
		;
		p_restor(II);
		;
		;
		goto R999;
	}

