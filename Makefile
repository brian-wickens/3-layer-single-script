default:
	@cat makefile
    
view:
	@make test
# If we want to run tests each time view is called
# We need to re-init the database as the tests call delete_database()
	@make init
	python db_viewer.py
    
init:
	python initialize_database.py

test:
	pytest -vvx --setup-show db_viewer.py
    
clean:
# Will only execute rm if the file exists
ifneq ($(wildcard aquarium.db), )
	rm aquarium.db
endif

clean_view:
	@make clean
	@make init
	@make view